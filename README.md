# VPC WINNER - this is a work in progress to create a multi-vpc, multi-az #infrastructure

This module creates a VPC across availability zones with  public subnet and  private subnet in each availability zone, a NAT gateway in each public subnet and an internet gateway.

## Input Variables:
 
* vpc_public_subnets - comma separated list of public subnet cidrs
* vpc_private_subnets - comma separated list of private subnet cidrs
* region - aws region
* azs - comma separated list of AZs in which to distribute subnets
* vpc_instance_tenancy - A tenancy option for instances launched into the VPC  
  This can be set to either 'default' or 'dedicated'. In most cases it should be set to 'default' unless there is a specific requirement that justifies using dedicated hardware.

## Usage: 

Include into your terrform files the following way:

```
module "vpc" {  
  source               = "..//modules/tf-mod-vpc"  
  vpc_cidr             = "172.20.10.128/26"
  azs                  = "a,b"
  region               = "eu-west-1"
  vpc_name             = "dev0001"
  vpc_public_subnets   = "172.20.10.128/28,172.20.10.160/28"
  vpc_private_subnets  = "172.20.10.144/28,172.20.10.176/28"
  vpc_instance_tenancy = "default"
}
```

## Outputs:

* vpc_id
* private_subnet_ids
* public_subnet_ids
* public_route_table_ids
* private_route_table_ids
* private_route_table_count
* vpc_cidr
