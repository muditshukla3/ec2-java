# general variable
variable "main_project_tag" {
  description = "Tag that will be attached to all resources."
  type        = string
  default     = "Test-Project"
}

variable "aws_default_region" {
  description = "The default region that all resources will be deployed into."
  type        = string
  default     = "ap-south-1"
}

variable "aws_ec2-ami" {
    description = "The default ec2 ami id"
    type = string
    default = "ami-099b3d23e336c2e83"
}

variable "aws_ec2_connection_key_name" {
   description = "The default key pair to connect to ec2 instance"
   type = string
   default = "ap-south1-key"
}

variable "aws_ec2_instance_type" {
  description = "The default instance type for ec2 instance"
  type = string
  default = "t2.micro"
}

variable "aws_default_vpc_id" {
  description = "The default vpc id"
  type = string
  default = "vpc-0282be1c1a42c5c83"
}

variable "allowed_cidr_blocks" {
  description = "List of CIDR blocks allowed to access ec2 instances.  Defaults to Everywhere."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}