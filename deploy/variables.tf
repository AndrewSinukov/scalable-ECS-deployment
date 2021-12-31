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

