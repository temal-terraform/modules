resource "aws_instance" "nat_1a" {
  ami                         = "${data.aws_ami.nat_ami.id}"
  availability_zone           = "eu-central-1a"
  instance_type               = "t3.micro"
  vpc_security_group_ids      = ["${aws_security_group.nat_security_group.id}"]
  subnet_id                   = "${data.aws_subnet.public_1a.id}"
  associate_public_ip_address = true
  source_dest_check           = false
  key_name                    = "${var.ssh_key_name}"

  tags {
    Name        = "nat.${var.environment}.${var.tenant}"
    environment = "${var.environment}"
    tenant      = "${var.tenant}"
    service     = "nat"
  }
}

resource "aws_instance" "nat_1b" {
  ami                         = "${data.aws_ami.nat_ami.id}"
  availability_zone           = "eu-central-1b"
  instance_type               = "t3.micro"
  vpc_security_group_ids      = ["${aws_security_group.nat_security_group.id}"]
  subnet_id                   = "${data.aws_subnet.public_1b.id}"
  associate_public_ip_address = true
  source_dest_check           = false
  key_name                    = "${var.ssh_key_name}"

  tags {
    Name        = "nat.${var.environment}.${var.tenant}"
    environment = "${var.environment}"
    tenant      = "${var.tenant}"
    service     = "nat"
  }
}

resource "aws_instance" "nat_1c" {
  ami                         = "${data.aws_ami.nat_ami.id}"
  availability_zone           = "eu-central-1c"
  instance_type               = "t3.micro"
  vpc_security_group_ids      = ["${aws_security_group.nat_security_group.id}"]
  subnet_id                   = "${data.aws_subnet.public_1c.id}"
  associate_public_ip_address = true
  source_dest_check           = false
  key_name                    = "${var.ssh_key_name}"

  tags {
    Name        = "nat.${var.environment}.${var.tenant}"
    environment = "${var.environment}"
    tenant      = "${var.tenant}"
    service     = "nat"
  }
}
