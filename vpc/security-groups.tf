# Default security group
resource "aws_default_security_group" "default_vpc_security_group" {
  vpc_id = "${aws_vpc.vpc.id}"

  # allow only incoming ssh and outgoing ephemeral ports
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 32768
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    environment = "${var.environment}"
    tenant      = "${var.tenant}"
  }
}

resource "aws_security_group" "allow_all_internal" {
  name        = "allow-all-internal-${var.tenant}-${var.environment}"
  description = "Allow all inbound traffic"
  vpc_id      = "${aws_vpc.vpc.id}"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["10.0.0.0/8"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name        = "allow-all-internal-${var.tenant}-${var.environment}"
    environment = "${var.environment}"
    tenant      = "${var.tenant}"
  }
}
