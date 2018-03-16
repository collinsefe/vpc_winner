/*

module "vpc" {
  source               = "modules/tf-mod-vpc"
  vpc_cidr             = "${var.vpc-cidr}"
  azs                  = "${var.azs}"
  region               = "${var.vpc-region}"
  vpc_name             = "${var.vpc-name}"
  vpc_public_subnets   = "${var.vpc-public-subnets}"
  vpc_private_subnets  = "${var.vpc-private-subnets}"
  vpc_instance_tenancy = "${var.vpc-tenancy}"
*/


module "vpc" {
  source               = "modules/tf-mod-vpc"
  vpc_cidr             = "172.20.10.128/26"
  azs                  = "a,b"
  region               = "eu-west-1"
  vpc_name             = "dev001"
#  vpc_public_subnets   = "172.20.10.128/28"
#  vpc_private_subnets  = "172.20.10.144/28"

  vpc_public_subnets   = "172.20.10.128/28,172.20.10.160/28"
  vpc_private_subnets  = "172.20.10.144/28,172.20.10.176/28"
  
  vpc_instance_tenancy = "default"

}
