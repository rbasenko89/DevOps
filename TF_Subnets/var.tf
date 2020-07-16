variable "region" {
  description = "EC2 region"
  type = string
  default = "us-east-2"
}

variable "public_key_path" {
  description = "Public key path"
  default = "id_rsa.pub"
}