resource "aws_vpc" "mainvpc" {
  cidr_block       = var.app_cidr
  instance_tenancy = "default"
  tags = {
    Name = "mainvpc-${var.vpc_name}"
    Terraform = "true"
  }
}

resource "aws_subnet" "private_subnets" {
  depends_on = [aws_vpc.mainvpc]
  vpc_id     = aws_vpc.mainvpc.id
  cidr_block = element(var.private_subnet_cidr, count.index)
  count = length(var.private_subnet_cidr)
  availability_zone = element(var.availability_zone, count.index)
  map_public_ip_on_launch = false
  tags = {
    Name = "private-subnet-${count.index + 1}"
    Terraform = "true"
  }
}

resource "aws_subnet" "public_subnets" {
  depends_on = [aws_vpc.mainvpc]
  vpc_id = aws_vpc.mainvpc.id
  cidr_block = element(var.public_subnet_cidr, count.index)
  count = length(var.public_subnet_cidr)
  availability_zone = element(var.availability_zone, count.index)
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet-${count.index + 1}"
    Terraform = "true"
  }
}
output "privatesubnet" {
  value =  ["${aws_subnet.private_subnets.*.id}"]
}
output "publicsubnet" {
  value = ["${aws_subnet.public_subnets.*.id}"]
}
output "vpc" {
  value = aws_vpc.mainvpc.id
}








