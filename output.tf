output "vpc_id" {
  value = "${module.vpc.vpc_id}"
}

output "private_subnet_ids" {
  value = "${module.vpc.private_subnet_ids}"
}

output "public_subnet_ids" {
  value = "${module.vpc.public_subnet_ids}"
}

output "public_route_table_ids" {
  value = "${module.vpc.public_route_table_ids}"
}

output "private_route_table_ids" {
  value = "${module.vpc.private_route_table_ids}"
}

output "private_route_table_count" {
  value = "${module.vpc.private_route_table_count}"
}

output "vpc_cidr" {
  value = "${module.vpc.vpc_cidr}"
}
