# output.tf

# Output the public IP of the EC2 instance
output "instance_public_ip" {
description = "The public IP address of the EC2 instance"
value       = aws_instance.name.public_ip
}

# Output the instance ID of the EC2 instance
output "instance_id" {
description = "The ID of the EC2 instance"
value       = aws_instance.name.id
}

# Output the private IP of the EC2 instance
output "instance_private_ip" {
description = "The private IP address of the EC2 instance"
value       = aws_instance.name.private_ip
}

# Output the availability zone where the EC2 instance is launched
output "instance_availability_zone" {
description = "The availability zone of the EC2 instance"
value       = aws_instance.name.availability_zone
}
