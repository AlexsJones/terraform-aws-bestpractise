resource "aws_instance" "data-server-a" {
  depends_on = ["aws_instance.bastion-eu-west1a"]

  connection {
    user     = "ec2-user"
    key_file = "${aws_key_pair.terraform.key_file}"
  }

  availability_zone = "eu-west-1a"
  ami               = "ami-70edb016"
  instance_type     = "t2.micro"
  key_name          = "${aws_key_pair.terraform.id}"

  security_groups = ["${aws_security_group.allow_bastion.id}"]

  subnet_id = "${aws_subnet.private-One.id}"
}

resource "aws_instance" "data-server-b" {
  depends_on = ["aws_instance.bastion-eu-west1b"]

  connection {
    user     = "ec2-user"
    key_file = "${aws_key_pair.terraform.key_file}"
  }

  availability_zone = "eu-west-1b"
  ami               = "ami-70edb016"
  instance_type     = "t2.micro"
  key_name          = "${aws_key_pair.terraform.id}"

  security_groups = ["${aws_security_group.allow_bastion.id}"]

  subnet_id = "${aws_subnet.private-Two.id}"
}
