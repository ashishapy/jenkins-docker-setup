output "Public_IP" {
  value = "${aws_instance.jenkins.public_ip}"
}