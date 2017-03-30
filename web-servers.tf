resource "aws_instance" "web-server-a" {
  depends_on = ["aws_key_pair.terraform"]

  availability_zone = "${lookup(var.availability_zone,"primary")}"
  ami               = "${lookup(var.amazon_amis,"${var.region}")}"
  instance_type     = "t2.micro"
  key_name          = "${aws_key_pair.terraform.id}"

  security_groups = ["${aws_security_group.web.id}"]

  subnet_id = "${aws_subnet.public-One.id}"

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get -y update",
      "sudo apt-get -y install nginx",
      "sudo service nginx start",
    ]
  }
}

resource "aws_instance" "web-server-b" {
  depends_on = ["aws_key_pair.terraform"]

  availability_zone = "${lookup(var.availability_zone,"secondary")}"
  ami               = "${lookup(var.amazon_amis,"${var.region}")}"
  instance_type     = "t2.micro"
  key_name          = "${aws_key_pair.terraform.id}"

  security_groups = ["${aws_security_group.web.id}", "${aws_security_group.bastion.id}"]

  subnet_id = "${aws_subnet.public-Two.id}"

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get -y update",
      "sudo apt-get -y install nginx",
      "sudo service nginx start",
    ]
  }
}
