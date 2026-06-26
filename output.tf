output "public_ip_address" {
  value = aws_instance.first-ec2.public_ip
}

output "private_ip_address" {
  value = aws_instance.first-ec2.private_ip
}