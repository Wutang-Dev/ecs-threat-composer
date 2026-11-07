output "vpc_id" {
  value       = aws_vpc.main.id
  description = "The ID of the VPC."
}
output "public_subnet_ids" {
  value       = aws_subnet.public[*].id
  description = "The IDs of the public subnets."
}
output "private_subnet_ids" {
  value       = aws_subnet.private[*].id
  description = "The IDs of the private subnets."
}
output "internet_gateway_id" {
  value       = aws_internet_gateway.main.id
  description = "The ID of the Internet Gateway."
}
output "public_subnet_azs" {
  value       = aws_subnet.public[*].availability_zone
  description = "The availability zones of the public subnets."
}
output "private_subnet_azs" {
  value       = aws_subnet.private[*].availability_zone
  description = "The availability zones of the private subnets."
}
output "public_subnet_cidrs" {
  value       = aws_subnet.public[*].cidr_block
  description = "The CIDR blocks of the public subnets."
}
output "private_subnet_cidrs" {
  value       = aws_subnet.private[*].cidr_block
  description = "The CIDR blocks of the private subnets."
}
# private route table id
output "private_route_table_id" {
  value       = aws_route_table.private.id
  description = "The ID of the private route table."
}
#nat gateway id
output "nat_gateway_id" {
  value       = aws_nat_gateway.main.id
  description = "The ID of the NAT Gateway."
}