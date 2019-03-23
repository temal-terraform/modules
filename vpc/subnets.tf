// eu-central-1a
resource "aws_subnet" "private_eu_central_1a" {
  availability_zone = "eu-central-1a"
  cidr_block        = "10.${var.second_octet}.0.0/19"
  vpc_id            = "${aws_vpc.vpc.id}"

  tags {
    Name        = "${var.environment}-${var.tenant}-private"
    environment = "${var.environment}"
    tenant      = "${var.tenant}"
    type        = "private"
    az          = "eu-central-1a"
  }
}

resource "aws_subnet" "public_eu_central_1a" {
  availability_zone       = "eu-central-1a"
  cidr_block              = "10.${var.second_octet}.32.0/20"
  map_public_ip_on_launch = true
  vpc_id                  = "${aws_vpc.vpc.id}"

  tags {
    Name        = "${var.environment}-${var.tenant}-public"
    environment = "${var.environment}"
    tenant      = "${var.tenant}"
    type        = "public"
    az          = "eu-central-1a"
  }
}

resource "aws_subnet" "spare_eu_central_1a" {
  availability_zone = "eu-central-1a"
  cidr_block        = "10.${var.second_octet}.48.0/20"
  vpc_id            = "${aws_vpc.vpc.id}"

  tags {
    Name        = "${var.environment}-${var.tenant}-spare"
    environment = "${var.environment}"
    tenant      = "${var.tenant}"
    type        = "spare"
    az          = "eu-central-1a"
  }
}

// eu-central-1b
resource "aws_subnet" "private_eu_central_1b" {
  availability_zone = "eu-central-1b"
  cidr_block        = "10.${var.second_octet}.64.0/19"
  vpc_id            = "${aws_vpc.vpc.id}"

  tags {
    Name        = "${var.environment}-${var.tenant}-private"
    environment = "${var.environment}"
    tenant      = "${var.tenant}"
    type        = "private"
    az          = "eu-central-1b"
  }
}

resource "aws_subnet" "public_eu_central_1b" {
  availability_zone       = "eu-central-1b"
  cidr_block              = "10.${var.second_octet}.96.0/20"
  map_public_ip_on_launch = true
  vpc_id                  = "${aws_vpc.vpc.id}"

  tags {
    Name        = "${var.environment}-${var.tenant}-public"
    environment = "${var.environment}"
    tenant      = "${var.tenant}"
    type        = "public"
    az          = "eu-central-1b"
  }
}

resource "aws_subnet" "spare_eu_central_1b" {
  availability_zone = "eu-central-1b"
  cidr_block        = "10.${var.second_octet}.112.0/20"
  vpc_id            = "${aws_vpc.vpc.id}"

  tags {
    Name        = "${var.environment}-${var.tenant}-spare"
    environment = "${var.environment}"
    tenant      = "${var.tenant}"
    type        = "spare"
    az          = "eu-central-1b"
  }
}

// eu-central-1c
resource "aws_subnet" "private_eu_central_1c" {
  availability_zone = "eu-central-1c"
  cidr_block        = "10.${var.second_octet}.128.0/19"
  vpc_id            = "${aws_vpc.vpc.id}"

  tags {
    Name        = "${var.environment}-${var.tenant}-private"
    environment = "${var.environment}"
    tenant      = "${var.tenant}"
    type        = "private"
    az          = "eu-central-1c"
  }
}

resource "aws_subnet" "public_eu_central_1c" {
  availability_zone       = "eu-central-1c"
  cidr_block              = "10.${var.second_octet}.160.0/20"
  map_public_ip_on_launch = true
  vpc_id                  = "${aws_vpc.vpc.id}"

  tags {
    Name        = "${var.environment}-${var.tenant}-public"
    environment = "${var.environment}"
    tenant      = "${var.tenant}"
    type        = "public"
    az          = "eu-central-1c"
  }
}

resource "aws_subnet" "spare_eu_central_1c" {
  availability_zone = "eu-central-1c"
  cidr_block        = "10.${var.second_octet}.176.0/20"
  vpc_id            = "${aws_vpc.vpc.id}"

  tags {
    Name        = "${var.environment}-${var.tenant}-spare"
    environment = "${var.environment}"
    tenant      = "${var.tenant}"
    type        = "spare"
    az          = "eu-central-1c"
  }
}
