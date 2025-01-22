variable "ami" {
  type        = string
  description = "AMI ID"
}

variable "instance_type" {
  type        = string
  description = "Instance Type"
}

variable "key_name" {
  type        = string
  description = "Key Pair Name"
}

variable "vpc_id" {
  type        = string
  description = "ID of the VPC"
}

variable "subnet_id" {
  type        = string
  description = "ID of the subnet"
}

variable "security_group_ids" {
  type = list(string)
  description = "List of security group IDs"
}
