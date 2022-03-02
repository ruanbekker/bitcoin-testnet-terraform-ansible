output "ip" {
  value       = aws_instance.node.public_ip
  sensitive   = true
  description = "The public ip address of the ec2 instance"
}

output "instance_id" {
  value       = aws_instance.node.instance_id
  sensitive   = true
  description = "The instance_id of the ec2 instance"
}