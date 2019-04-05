resource "aws_security_group" "nat" {
  name        = "allow-nat-traffic-${var.environment}-${var.tenant}"
  description = "Allow incoming and outgoing traffic of nat instance"
  vpc_id      = "${data.aws_vpc.selected.id}"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["${data.aws_vpc.selected.cidr_block}"]
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
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name        = "${var.environment}-${var.tenant}-nat-instance"
    environment = "${var.environment}"
    tenant      = "${var.tenant}"
  }
}
