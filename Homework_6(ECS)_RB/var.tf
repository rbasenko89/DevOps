variable "access_key" {
  type = string
}

variable "secret_key" {
  type = string
}

variable "app_port" {
  default = "8080"
}

variable "fargate_cpu" {
  default = "256"
}

variable "fargate_memory" {
  default = "512"
}

variable "app_image" {
  default = "rbasenko/node_image"
}