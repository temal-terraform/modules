resource "aws_vpc" "vpc" {
  cidr_block           = "10.${var.second_octet}.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags {
    Name        = "${var.environment}-${var.tenant}"
    environment = "${var.environment}"
    tenant      = "${var.tenant}"
  }
}

resource "aws_vpc_dhcp_options" "dhcp" {
  domain_name         = "eu-central-1.compute.internal"
  domain_name_servers = ["AmazonProvidedDNS"]
  ntp_servers         = ["169.254.169.123"]

  tags {
    Name        = "${var.environment}-${var.tenant}"
    environment = "${var.environment}"
    tenant      = "${var.tenant}"
  }
}

resource "aws_vpc_dhcp_options_association" "dhcp" {
  vpc_id          = "${aws_vpc.vpc.id}"
  dhcp_options_id = "${aws_vpc_dhcp_options.dhcp.id}"
}
