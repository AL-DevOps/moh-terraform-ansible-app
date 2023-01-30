output "ip_claster" {
  description = "Kubernetes Cluster Name"
  value       = aws_instance.web-server-for-app09.public_ip        
}
