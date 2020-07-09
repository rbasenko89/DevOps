variable "region" {
  description = "EC2 region"
  type = string
  default = "us-east-2"
}
variable "secret_key" {
  type = string
  description = "Access key for your AWS account"
}

variable "secret_id" {
  type = string
  description = "Secret key for your AWS account"
}
variable "aws_security_group" {
  description = "AWS security group id"
  type = string
  default = "sg-e677818f"
}
variable "subnet_numbers" {
  description = "Subnets assigned to VPC_test"
  default     = {
    "vpc_subnet_1" = 1
    "vpc_subnet_2" = 2
  }
}