data "aws_ami" "nat_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn-ami-vpc-nat*"]
  }

  owners = ["amazon"]
}

data "aws_vpc" "selected" {
  tags {
    Name        = "${var.environment}-${var.tenant}"
    environment = "${var.environment}"
    tenant      = "${var.tenant}"
  }
}

data "aws_route_table" "private" {
  tags {
    Name        = "${var.environment}-${var.tenant}-private"
    environment = "${var.environment}"
    tenant      = "${var.tenant}"
  }
}

data "aws_subnet" "public" {
  tags {
    Name        = "${var.environment}-${var.tenant}-public"
    environment = "${var.environment}"
    tenant      = "${var.tenant}"
    az          = "${var.availability_zone}"
  }
}
