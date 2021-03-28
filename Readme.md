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
## No of modules used in the project:
- Here we have used to modules:
    - first module is **vpc** : for detailed explanation please follow this :  [link](https://github.com/sparth510/terraform_vpc_ec2_webserver/blob/main/network/README.md)
    - second module is **ec2** : for more understand please follow this [link](https://github.com/sparth510/terraform_vpc_ec2_webserver/blob/main/ec2/README.md)