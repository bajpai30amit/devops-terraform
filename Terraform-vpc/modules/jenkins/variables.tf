variable "region" {
  description = "The AWS region to deploy the Jenkins server"
  type        = string
}

variable "ami_id" {
  description = "The AMI ID to use for the Jenkins server"
  type        = string
  default 	  = "ami-0984f4b9e98be44bf""
}

variable "instance_type" {
  description = "The instance type for the Jenkins server"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "The name of the SSH key pair to use for the Jenkins server"
  type        = string
}

variable "ssh_allowed_cidr" {
  description = "CIDR block allowed to access the server over SSH"
  type        = string
  default     = "0.0.0.0/0"
}

variable "http_allowed_cidr" {
  description = "CIDR block allowed to access the Jenkins web interface"
  type        = string
  default     = "0.0.0.0/0"
}
