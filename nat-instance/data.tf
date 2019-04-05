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

data "aws_route_table" "private_1a" {
  tags {
    Name        = "${var.environment}-${var.tenant}-private-1a"
    environment = "${var.environment}"
    tenant      = "${var.tenant}"
  }
}

data "aws_route_table" "private_1b" {
  tags {
    Name        = "${var.environment}-${var.tenant}-private-1b"
    environment = "${var.environment}"
    tenant      = "${var.tenant}"
  }
}

data "aws_route_table" "private_1c" {
  tags {
    Name        = "${var.environment}-${var.tenant}-private-1c"
    environment = "${var.environment}"
    tenant      = "${var.tenant}"
  }
}

data "aws_subnet" "public_1a" {
  tags {
    Name        = "${var.environment}-${var.tenant}-public"
    environment = "${var.environment}"
    tenant      = "${var.tenant}"
    az          = "eu-central-1a"
  }
}

data "aws_subnet" "public_1b" {
  tags {
    Name        = "${var.environment}-${var.tenant}-public"
    environment = "${var.environment}"
    tenant      = "${var.tenant}"
    az          = "eu-central-1b"
  }
}

data "aws_subnet" "public_1c" {
  tags {
    Name        = "${var.environment}-${var.tenant}-public"
    environment = "${var.environment}"
    tenant      = "${var.tenant}"
    az          = "eu-central-1c"
  }
}
