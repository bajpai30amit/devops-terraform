resource "aws_instance" "web" {
    count = length(var.ec2_names)
	  ami = data.aws_ami.amazon-2.id
    instance_type = "t2.micro"
    vpc_security_group_ids = [var.sg_id]
    associate_public_ip_address = true
    subnet_id = var.subnets[count.index]
    availability_zone = data.aws_availability_zones.available.names[count.index]
    
    user_data = <<EOF
	  #!/bin/bash
	  wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
	  sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
	  sudo apt update && sudo apt upgrade -y
	  sudo apt install default-jre -y
	  sudo apt install jenkins -y
	  sudo systemctl start jenkins
    EOF

    tags = {
        Name = var.ec2_names[count.index]
    }
}
