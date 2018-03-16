#---------------------------
# Global variables
#---------------------------

provider "aws" {
  region = "eu-west-1"
}

variable "region" {
  default = "eu-west-1"
}

variable "azs" {
  default = "a,b"
}

variable "bucket" {
  default = "tf-state-dev001-vpc"
}

# VPC Config

/*
variable "vpc-cidr" {
  default = "10.158.1.0/25"
}
variable "azs" {
  default = "a,b"
}
variable "vpc-region" {
  default = "eu-west-1"
}
variable "vpc-name" {
  default = "dcuk-072-vpc"
}
variable "vpc-public-subnets" {
  default = "10.158.1.0/27,10.158.1.64/27"
}
variable "vpc-private-subnets" {
  default = "10.158.1.32/27,10.158.1.96/27"
}
variable "vpc-tenancy" {
  default = "default"
}
*/

/*

# VPC for Jenkins - Account Factory 003

variable "vpc-cidr" {
  default = "10.158.0.32/27"
}

variable "azs" {
  default = "a"
}

variable "vpc-region" {
  default = "eu-west-1"
}

variable "vpc-name" {
  default = "dev001"
}

variable "vpc-public-subnets" {
  default = ""
}

variable "vpc-private-subnets" {
  default =  ""
}

variable "vpc-tenancy" {
  default = "default"
}
*/



