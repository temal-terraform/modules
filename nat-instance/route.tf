resource "aws_route" "to_nat_instance" {
  route_table_id         = "${data.aws_route_table.private.id}"
  destination_cidr_block = "0.0.0.0/0"
  instance_id            = "${aws_instance.nat.id}"
}
