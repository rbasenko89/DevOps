Terraform version - v0.12.28
AWS version - aws-cli/1.18.95 Python/2.7.16 Darwin/19.5.0 botocore/1.17.18

How to use current solution:

1. Configure Access Key, Secret key and region by running 'aws configure' in terminal (also they could be provided as a variables in dev.tfvars file)
2. Run following commans in terminal: 
terraform init
terraform plan
terraform apply

**NOTE real ssh keys are not commited to this folder, but they should be present as they are used by terraform script.

