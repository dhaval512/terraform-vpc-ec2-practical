## Pre-requisites
 - Administrative rights to the AWS account on which the stack needs to be deployed
 - AWS cli  installed and configured and administarative rights have been assigned to the user configured with it
 - Terraform v0.12 installed
 ## Instructions to use
 - steps:
 - 1. Download the source code to the local
   ``` 
   git clone https://github.com/dhaval512/terraform-vpc-ec2-practical.git
   ```
 - 2. after clonning repository .  Prepare the current working directory by initializing the terraform
   ``` 
   terraform init 
   ```
 - 3. Now create an execution plan by running below command:
  ``` 
  terraform plan 
  ```
 - 4. Execute the terraform template to create the resources by running below command:
 ```
terraform apply
```
-  If you want to change the aws region You can change it from here [here](https://github.com/dhaval512/terraform-vpc-ec2-practical/blob/master/provider.tf#L2) 
- If you want to change the availabilty zone [availability zone](https://github.com/dhaval512/terraform-vpc-ec2-practical/blob/master/modules/vpc/vairable.tf#L14)

## Number of modules used in the project:
- Here we have used to modules:
    - first module is **VPC** : for detailed explanation please follow this :  [link](https://github.com/dhaval512/terraform-vpc-ec2-practical/blob/master/modules/vpc/Readme.md))
    - second module is **EC2** : for more understand please follow this [link](https://github.com/dhaval512/terraform-vpc-ec2-practical/blob/master/modules/instance/Readme.md)