Terraform version - v0.12.28 AWS version - aws-cli/1.18.95 Python/2.7.16 Darwin/19.5.0 botocore/1.17.18
free domain is registered on freenom.com website

How to use current solution:
1. This solution will read aws secrets and keys from user's home directory
2. perform follosing commands when cloned this repo:
- terraform init
- terraform plan
- terraform apply
3. After all stuff is created, up and running go to AWS console, open Route533 section -> Hosted Zones and find domain (in our example - mynewdomain.ml)
4. Copy values from tehre and put to nameservers of your registered domsin on freenom.com website
5. After it is done you can run contenerized application on http://app.mynewdomain.ml:8080/ (example from this code)
