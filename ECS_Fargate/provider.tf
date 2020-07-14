provider "aws" {
  region                  = "${var.aws_region}"
  shared_credentials_file = "/Users/ramella.basenko/.aws/credentials"
  profile                 = "default"
}
