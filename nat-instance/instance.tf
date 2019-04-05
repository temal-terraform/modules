resource "aws_instance" "nat" {
  ami                         = "${data.aws_ami.nat_ami.id}"
  availability_zone           = "eu-central-1a"
  instance_type               = "t3.micro"
  vpc_security_group_ids      = ["${aws_security_group.nat_security_group.id}"]
  subnet_id                   = "${data.aws_subnet.public.id}"
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
