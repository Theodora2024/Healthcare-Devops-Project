output "instance_id" {

  value = aws_instance.healthcare_server.id

}

output "public_ip" {

  value = aws_instance.healthcare_server.public_ip

}

output "private_ip" {

  value = aws_instance.healthcare_server.private_ip

}