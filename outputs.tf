# output module for my EC2 

output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.app_server1.id
}

output "instance_public_ip" {
  description = "The EC2's Public IP"
  value       = aws_instnace.app_server.public_ip
}