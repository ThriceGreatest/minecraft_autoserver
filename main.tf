provider "aws" {
  region = "us-east-1"  # Adjust to your preferred region
}

resource "aws_instance" "minecraft" {
  ami           = "ami-04b70fa74e45c3917"  # Update to a valid AMI ID for your region
  instance_type = "t2.medium"
  key_name      = "minecraft-key"

  security_groups = [aws_security_group.minecraft.name]

  tags = {
    Name = "Minecraft Server"
  }
}

resource "aws_security_group" "minecraft" {
  name = "minecraft-sg"

  ingress {
    from_port   = 25565
    to_port     = 25565
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
