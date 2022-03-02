variable "aws_region" {
  type        = string
  default     = "eu-west-1"
  description = "The AWS Region to use."
}

variable "ami_prefix" {
  type        = string
  description = "The AMI prefix that is created by packer."
}

variable "instance_type" {
  type        = string
  default     = "t3.micro"
  description = "The network tier to use, eg. private or public."
}

variable "network_tier" {
  type        = string
  default     = "public"
  description = "The network tier to use, eg. private or public."
}

variable "team" {
  type        = string
  default     = "devops"
  description = "The team name owning the resource."
}

variable "coin" {
  type        = string
  default     = "bitcoin"
  description = "The crypto node name."
}

variable "environment" {
  type        = string
  default     = "dev"
  description = "The environment name."
}

variable "key_name" {
  type        = string
  description = "The ssh key name."
}
