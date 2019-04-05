resource "aws_route" "to_nat_instance_1a" {
  route_table_id         = "${data.aws_route_table.private_1a.id}"
  destination_cidr_block = "0.0.0.0/0"
  instance_id            = "${aws_instance.nat_1a.id}"
}

resource "aws_route" "to_nat_instance_1b" {
  route_table_id         = "${data.aws_route_table.private_1b.id}"
  destination_cidr_block = "0.0.0.0/0"
  instance_id            = "${aws_instance.nat_1b.id}"
}

resource "aws_route" "to_nat_instance_1c" {
  route_table_id         = "${data.aws_route_table.private_1c.id}"
  destination_cidr_block = "0.0.0.0/0"
  instance_id            = "${aws_instance.nat_1c.id}"
}
