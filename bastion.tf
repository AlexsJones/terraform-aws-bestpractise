resource "aws_instance" "bastion-eu-west1a" {
  ami               = "ami-70edb016"
  availability_zone = "eu-west-1a"
  instance_type     = "t2.micro"
  key_name          = "${aws_key_pair.terraform.id}"

  security_groups = ["${aws_security_group.bastion.id}"]

  subnet_id = "${aws_subnet.public-One.id}"

  source_dest_check           = false
  associate_public_ip_address = true
}

resource "aws_eip" "bastion-eu-west1a-eip" {
  instance = "${aws_instance.bastion-eu-west1a.id}"
  vpc      = true
}

resource "aws_instance" "bastion-eu-west1b" {
  ami               = "ami-70edb016"
  availability_zone = "eu-west-1b"
  instance_type     = "t2.micro"
  key_name          = "${aws_key_pair.terraform.id}"

  security_groups = ["${aws_security_group.bastion.id}"]

  subnet_id = "${aws_subnet.public-Two.id}"

  source_dest_check           = false
  associate_public_ip_address = true
}

resource "aws_eip" "bastion-eu-west1b-eip" {
  instance = "${aws_instance.bastion-eu-west1b.id}"
  vpc      = true
}
