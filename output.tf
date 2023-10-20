output "public_ip" {
    description = "The public ip assigned to ec2 instance"
    value = try(aws_instance.test.public_ip, "")
}