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
output "private_route_table_id" {
  value       = aws_route_table.private.id
  description = "The ID of the private route table."
}
output "nat_gateway_id" {
  value       = aws_nat_gateway.main.id
  description = "The ID of the NAT Gateway."
}
output "nat_gateway_public_ip" {
  value       = aws_eip.nat.public_ip
  description = "The public IP of the NAT Gateway."
}
output "alb_security_group_id" {
  value       = aws_security_group.alb_sg.id
  description = "The ID of the Application Load Balancer security group."
}
output "ecs_security_group_id" {
  value       = aws_security_group.ecs_sg.id
  description = "The ID of the ECS security group."
}