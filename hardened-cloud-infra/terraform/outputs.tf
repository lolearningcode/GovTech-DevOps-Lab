output "vpc_id" {
  description = "The ID of the VPC created."
  value       = aws_vpc.main.id
}

output "public_subnet_id" {
  description = "The ID of the public subnet created."
  value       = aws_subnet.public.id
}

output "private_subnet_id" {
  description = "The ID of the private subnet created."
  value       = aws_subnet.private.id
}

output "cis_instance_id" {
  value = aws_instance.cis_target.id
  description = "The instance ID of the CIS-hardened EC2 instance"
}