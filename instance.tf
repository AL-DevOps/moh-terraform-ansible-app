resource "aws_instance" "web-server-for-app01" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"

  # the VPC subnet  --> public-sub-1a
  subnet_id = "subnet-0b420fcad1d505edc"

  # the security group --> Security-Group-Jenkins
  vpc_security_group_ids = ["sg-07a3bd50608f1e96e"]

  # the public SSH key
  key_name = "key-virginia"

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
