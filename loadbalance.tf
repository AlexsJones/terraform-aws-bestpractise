resource "aws_elb" "web" {
  name = "terraform-example-elb"

  subnets         = ["${aws_subnet.public-One.id}", "${aws_subnet.public-Two.id}"]
  security_groups = ["${aws_security_group.web.id}"]
  instances       = ["${aws_instance.web-server-a.id}", "${aws_instance.web-server-b.id}"]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
}
