data "aws_ami" "ami" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_autoscaling_group" "autoscaling-web-server-group" {
  name = "web-server-autoscaling-group"
  launch_configuration = aws_launch_configuration.autoscale.id
  desired_capacity    = 1
  max_size            = 1
  min_size            = 1
  health_check_type   = "ELB"
  vpc_zone_identifier = element(module.vpc.privatesubnet.*, 1)
}

module "vpc" {
  source = "../vpc"
}
resource "time_sleep" "wait_120_seconds" {
  depends_on = [aws_autoscaling_group.autoscaling-web-server-group,aws_autoscaling_attachment.autoscaling-web-server-group]
  create_duration = "120s"
}

output "lb_address" {
   depends_on = [aws_autoscaling_attachment.autoscaling-web-server-group]
  value = aws_lb.web-server.dns_name
}
resource "aws_launch_configuration" "autoscale" {
  name = "web-server-launch-configuration"
  image_id        = data.aws_ami.ami.id
  instance_type   = var.instance_type
  security_groups = ["${aws_security_group.instance_sg.id}"]
  # key_name               = var.key_name
  user_data = <<EOF
          #! /bin/bash
          sudo yum update -y
          sudo yum install -y httpd.x86_64
          sudo systemctl start httpd
          sudo systemctl enable httpd
          echo "web-server is working" >  /var/www/html/index.html
          "mkfs -t ext4 /dev/sda2\n",
          "echo \"/dev/sda2 /var/log ext4 defaults,nofail 0 2\" >> /etc/fstab\n",
          "mount -a\n"
            EOF
  ebs_block_device {
    device_name           = "/dev/sda2"
    volume_type           = "gp2"
    volume_size           = "10"
    delete_on_termination = true
  }

  lifecycle {
    create_before_destroy = true
  }
}
resource "aws_autoscaling_attachment" "autoscaling-web-server-group" {
  depends_on             = [aws_autoscaling_group.autoscaling-web-server-group, aws_lb.web-server]
  autoscaling_group_name = aws_autoscaling_group.autoscaling-web-server-group.id
  alb_target_group_arn   = aws_lb_target_group.web-server.arn
}

output "elb-endpoint" {
   depends_on = [aws_autoscaling_attachment.autoscaling-web-server-group]
  value = aws_lb.web-server.dns_name
}