variable "aws_region" {
  default = "us-east-2"
}

variable "domain" {
  default = "mynewdomain.ml"
}

variable "app_port" {
  default = "8080"
}


variable "app_count" {
  description = "Number of docker containers to run"
  default     = 4
}

variable "fargate_cpu" {
  default = "512"
}

variable "fargate_memory" {
  default = "1024"
}

variable "app_image" {
  default = "rbasenko/node_image"
}
