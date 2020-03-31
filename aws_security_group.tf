resource "aws_security_group" "ingress-swarm" {
  name = "allow-swarm"
  # Allow HTTP inbound
  ingress {
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 80
    to_port     = 80
  }
  # Allow HTTPS inbound
  ingress {
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 443
    to_port     = 443
  }
  # Allow ssh inbound
  ingress {
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    to_port     = 22
  }
  // Inbound to Swarm Managers (superset of worker ports)
  ingress {
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 2377
    to_port     = 2377
  }
  ingress {
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 7946
    to_port     = 7946
  }
  ingress {
    protocol    = "UDP"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 7946
    to_port     = 7946
  }
  ingress {
    protocol    = "UDP"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 4789
    to_port     = 4789
  }
  ingress {
    protocol    = "50"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    to_port     = 0
  }

  // Terraform removes the default rule
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
