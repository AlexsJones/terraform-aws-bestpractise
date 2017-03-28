output "key_name" {
  value = "${aws_key_pair.terraform.key_name}"
}

output "region" {
  value = "${var.region}"
}

output "private_cidr_block1" {
  value = "${var.private_cidr_block1}"
}

output "private_cidr_block2" {
  value = "${var.private_cidr_block2}"
}

output "public_cidr_block1" {
  value = "${var.public_cidr_block1}"
}

output "public_cidr_block2" {
  value = "${var.public_cidr_block2}"
}

output "bastion-eu-west1a" {
  value = "${aws_eip.bastion-eu-west1a-eip.public_ip}"
}

output "bastion-eu-west1b" {
  value = "${aws_eip.bastion-eu-west1b-eip.public_ip}"
}

output "data-server-eu-west1a" {
  value = "${aws_instance.data-server-a.private_ip}"
}

output "data-server-eu-west1b" {
  value = "${aws_instance.data-server-b.private_ip}"
}
