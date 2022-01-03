variable "prefix" {
  default = "aad"
}

variable "project" {
  default = "app-api-devops"
}

variable "contact" {
  default = "some.email@gmail.com"
}

variable "db_username" {
  description = "Username for the RDS Postgres instance"
}

variable "db_password" {
  description = "Password for the RDS postgres instance"
}

variable "bastion_key_name" {
  default = "app-api-devops-bastion"
}

variable "ecr_image_api" {
  description = "ECR Image for API"
  default     = "<APP ECR Image URL>:latest"
}

variable "ecr_image_proxy" {
  description = "ECR Image for API"
  default     = "<App ECR Image for Proxy>:latest"
}

variable "django_secret_key" {
  description = "Secret key for Django app"
}


