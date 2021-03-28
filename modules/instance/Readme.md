# Instance Module
### In EC2 module we are creating Following  EC2 services 

- [Autoscaling](https://github.com/dhaval512/terraform-vpc-ec2-practical/blob/master/modules/instance/autoscaling.tf)
- [Load balancer](https://github.com/dhaval512/terraform-vpc-ec2-practical/blob/master/modules/instance/elb.tf)
- [Security groups](https://github.com/dhaval512/terraform-vpc-ec2-practical/blob/master/modules/instance/security.tf)

### Instance
- here We are using **amazon linux**,latest ami. [data source](https://github.com/dhaval512/terraform-vpc-ec2-practical/blob/master/modules/instance/autoscaling.tf#L1)
- We are using **aws_launch_configuration** for creating our ec2 instance 
- To change instance type change [here](https://github.com/dhaval512/terraform-vpc-ec2-practical/blob/master/modules/instance/variable.tf#L11)

## Loadbalancer
- We are creating loadbalancerr in public subnet [aws_lb](https://github.com/dhaval512/terraform-vpc-ec2-practical/blob/master/modules/instance/elb.tf#L1) 
 We are  attaching targate group to loadbalancer using terraform resource [aws_lb_target_group](https://github.com/dhaval512/terraform-vpc-ec2-practical/blob/master/modules/instance/elb.tf#L16)
## Autoscaling 

-  We are creating autoscaling service using terraform resouce  [aws_autoscaling_group](https://github.com/dhaval512/terraform-vpc-ec2-practical/blob/master/modules/instance/autoscaling.tf#L10) 
- For attaching our autoscaling group to application load balancer attachment we are using terraform resource [aws_autoscaling_attachment](https://github.com/dhaval512/terraform-vpc-ec2-practical/blob/master/modules/instance/autoscaling.tf#L60)

## Volume
- we have attached Secondary volume using terrafrom resource in [aws_launch_configuration](https://github.com/dhaval512/terraform-vpc-ec2-practical/blob/master/modules/instance/autoscaling.tf#49) and have mounted to instance with [user_data](https://github.com/dhaval512/terraform-vpc-ec2-practical/blob/master/modules/instance/autoscaling.tf#L38) script