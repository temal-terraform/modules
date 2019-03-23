# Internet gateway
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name        = "${var.environment}-${var.tenant}"
    environment = "${var.environment}"
    tenant      = "${var.tenant}"
  }
}

# Routing public subnets
resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name        = "${var.environment}-${var.tenant}-public"
    environment = "${var.environment}"
    tenant      = "${var.tenant}"
  }
}

resource "aws_route" "route_to_internet_gateway" {
  route_table_id         = "${aws_route_table.public.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.internet_gateway.id}"
}

resource "aws_route_table_association" "public_eu_central_1a" {
  subnet_id      = "${aws_subnet.public_eu_central_1a.id}"
  route_table_id = "${aws_route_table.public.id}"
}

resource "aws_route_table_association" "public_eu_central_1b" {
  subnet_id      = "${aws_subnet.public_eu_central_1b.id}"
  route_table_id = "${aws_route_table.public.id}"
}

resource "aws_route_table_association" "public_eu_central_1c" {
  subnet_id      = "${aws_subnet.public_eu_central_1c.id}"
  route_table_id = "${aws_route_table.public.id}"
}

# Routing private subnets
resource "aws_route_table" "private" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name        = "${var.environment}-${var.tenant}-private"
    environment = "${var.environment}"
    tenant      = "${var.tenant}"
  }
}

resource "aws_route_table_association" "private_eu_central_1a" {
  subnet_id      = "${aws_subnet.private_eu_central_1a.id}"
  route_table_id = "${aws_route_table.private.id}"
}

resource "aws_route_table_association" "private_eu_central_1b" {
  subnet_id      = "${aws_subnet.private_eu_central_1b.id}"
  route_table_id = "${aws_route_table.private.id}"
}

resource "aws_route_table_association" "private_eu_central_1c" {
  subnet_id      = "${aws_subnet.private_eu_central_1c.id}"
  route_table_id = "${aws_route_table.private.id}"
}
