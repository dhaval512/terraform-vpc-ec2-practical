# VPC Module
- in this module we are createing  **VPC*, **public_subnet** and **private_subnet**
- Here  we are creating 3 public and 3 private subnet in the mumbai region
- To change the value of cidr block open variable.tf and change here [here](https://github.com/dhaval512/terraform-vpc-ec2-practical/blob/master/modules/vpc/vairable.tf#L5)
-  If you want to change the aws region You can change it from here [here](https://github.com/dhaval512/terraform-vpc-ec2-practical/blob/master/provider.tf#L2) 
- If you want to change the availabilty zone [availability zone](https://github.com/dhaval512/terraform-vpc-ec2-practical/blob/master/modules/vpc/vairable.tf#L14)
## how to create resource , please check this file
- [VPC & subnet](https://github.com/dhaval512/terraform-vpc-ec2-practical/blob/master/modules/vpc/vpc.tf)
- [Nat Gateway](https://github.com/dhaval512/terraform-vpc-ec2-practical/blob/master/modules/vpc/nat_gateway.tf)
- [Internet Gateway](https://github.com/dhaval512/terraform-vpc-ec2-practical/blob/master/modules/vpc/internet_gateway.tf)
- [route_table](https://github.com/dhaval512/terraform-vpc-ec2-practical/blob/master/modules/vpc/routetable.tf)