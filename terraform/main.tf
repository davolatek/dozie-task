provider "aws" {
  region = "us-east-1" # Change to your desired region
}

resource "aws_security_group" "web" {
  name        = "web_sg"
  description = "Allow incoming traffic on port 3000"

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "web" {
  ami           = "ami-xxxxxxxxxxxxxxxxx" # Specify the AMI ID for the desired AWS instance
  instance_type = "t2.micro"
  key_name      = "your_key_pair"         # Replace with your key pair to be sused

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update
              sudo apt install -y nodejs npm
              git clone https://github.com/your-repo/node-crud.git /home/ubuntu/node-crud
              cd /home/ubuntu/node-crud
              npm install
              node src/app.js
            EOF

  tags = {
    Name = "web_instance_sample"
  }
}
