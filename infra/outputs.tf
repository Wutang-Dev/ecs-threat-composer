output "vpc_id" {
  description = "ID of the Threat Composer VPC"
  value       = module.vpc.vpc_id
}
output "public_subnet_ids" {
  description = "IDs of the public subnets"
  value       = module.vpc.public_subnet_ids
}
output "private_subnet_ids" {
  description = "IDs of the private subnets"
  value       = module.vpc.private_subnet_ids
}
output "internet_gateway_id" {
  description = "ID of the Internet Gateway"
  value       = module.vpc.internet_gateway_id
}
output "public_subnet_azs" {
  description = "Availability zones of the public subnets"
  value       = module.vpc.public_subnet_azs
}
output "private_subnet_azs" {
  description = "Availability zones of the private subnets"
  value       = module.vpc.private_subnet_azs
}
output "public_subnet_cidrs" {
  description = "CIDR blocks of the public subnets"
  value       = module.vpc.public_subnet_cidrs
}
output "private_subnet_cidrs" {
  description = "CIDR blocks of the private subnets"
  value       = module.vpc.private_subnet_cidrs
}
# private route table id
output "private_route_table_id" {
  description = "ID of the private route table"
  value       = module.vpc.private_route_table_id
}
# nat gateway id
output "nat_gateway_id" {
  description = "ID of the NAT Gateway"
  value       = module.vpc.nat_gateway_id
}
#output nat public ip
output "nat_gateway_public_ip" {
  description = "Public IP of the NAT Gateway"
  value       = module.vpc.nat_gateway_public_ip
}