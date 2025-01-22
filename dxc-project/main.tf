terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1" # Replace with your desired region
}

variable "ami" {
  type        = string
  description = "AMI ID"
  default     = "ami-0df8c184d5f6ae949" # Replace with the desired AMI ID
}

variable "instance_type" {
  type        = string
  description = "EC2 Instance Type"
  default     = "t2.micro"
}

variable "key_name" {
  type        = string
  description = "AWS Key Pair Name"
  default     = "key-migration"
}

module "vpc" {
  source  = "./modules/vpc"
  cidr_block = "10.0.0.0/16"
}

module "subnet" {
  source  = "./modules/subnet"
  vpc_id = module.vpc.id
  cidr_block = "10.0.0.0/24"
}

module "sg" {
  source  = "./modules/sg"
  vpc_id = module.vpc.id
}

module "ec2" {
  source       = "./modules/ec2"
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name
  vpc_id       = module.vpc.id
  subnet_id    = module.subnet.id
  security_group_ids = [module.sg.id]
}
