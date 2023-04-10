resource "aws_instance" "web-server-for-app01" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.medium"

  # the VPC subnet  --> public-sub-1c
  subnet_id = "subnet-08df9070c27cc7b6f"

  # the security group --> andrey-sequrity-group
  vpc_security_group_ids = ["sg-08c08ed163d0d5f6c"]

  # the public SSH key
  key_name = "andrey-moh-devops"

  # the server name in AWS
  tags = {
    Name = "andrey-web-app01"
  }

    # Creating test_IPs.txt file for TEST
   provisioner "local-exec" {
     command = <<EOF
       echo ${aws_instance.web-server-for-app01.private_ip}>> test_IPs.txt
       echo ${aws_instance.web-server-for-app01.public_ip}>> test_IPs.txt
     EOF
  }
  
  # Creating claster_name.txt file for deployment.yaml
   provisioner "local-exec" {
     command = <<EOF
       echo ${aws_instance.web-server-for-app01.private_ip}>> claster_name_from_terraform.txt
     EOF
  }

  # Creating the HOST file for Ansible
   provisioner "local-exec" {
     command = <<EOF
       echo web1 ansible_host=${aws_instance.web-server-for-app01.private_ip} ansible_connection=ssh ansible_user=ubuntu ansible_become=yes>> hosts
       echo [web_servers] >>hosts
       echo web1 >> hosts
     EOF
  }

}
