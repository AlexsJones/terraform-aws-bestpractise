resource "aws_instance" "data-server-a" {
  availability_zone = "eu-west-1a"
  ami               = "ami-edb9069e"
  instance_type     = "t2.micro"
  key_name          = "${aws_key_pair.terraform.id}"

  security_groups = ["${aws_security_group.allow_bastion.id}"]

  subnet_id = "${aws_subnet.private-One.id}"
}

resource "aws_instance" "data-server-b" {
  availability_zone = "eu-west-1b"
  ami               = "ami-edb9069e"
  instance_type     = "t2.micro"
  key_name          = "${aws_key_pair.terraform.id}"

  security_groups = ["${aws_security_group.allow_bastion.id}"]

  subnet_id = "${aws_subnet.private-Two.id}"
}
