variable "public_key_path" {
  description = <<DESCRIPTION
Path to the SSH public key to be used for authentication.
Ensure this keypair is added to your local SSH agent so provisioners can
connect.
Example: ~/.ssh/terraform.pub
DESCRIPTION
  default = "~/.ssh/id_rsa.pub"
}

variable "key_name" {
  description = "Desired name of AWS key pair"
  default = "myKey"
}

variable "aws_region" {
  description = "AWS region to launch servers."
  default     = "us-west-2"
}

# Docker 1.12.5 & Docker Compose 1.9 installed on Ubuntu 16.04 LTS (HVM)
variable "aws_amis" {
  default = {
    us-west-2 = "ami-1bb3057b"
  }
}

variable "aws_instance_type" {
  description = "AWS EC2 instance type."
  default     = "t2.medium"
}