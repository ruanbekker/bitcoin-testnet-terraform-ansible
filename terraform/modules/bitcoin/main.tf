data "aws_caller_identity" "current" {}

data "aws_ami" "packer_node_ami" {
  owners      = [data.aws_caller_identity.current.account_id]
  most_recent = true

  filter {
    name   = "tag:Name"
    values = ["${var.ami_prefix}*"]
  }
}

resource "aws_instance" "node" {
  ami             = data.aws_ami.packer_node_ami.id
  instance_type   = var.instance_type
  key_name        = var.key_name
  subnet_id       = data.aws_subnet.tier.id
  vpc_security_group_ids = [ aws_security_group.node.id ]
  tags = {
    Name = "${var.team}-${var.coin}-node-${var.environment}"
  }
}

resource "aws_security_group" "node" {
  name        = "${var.team}-${var.coin}-node-${var.environment}-ec2-sg"
  description = "Security Group for the EC2 Instance"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [ data.aws_vpc.default.cidr_block ]
  }

	ingress {
    from_port   = "80"
    to_port     = "80"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
	}
  
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}