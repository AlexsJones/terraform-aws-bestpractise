resource "aws_key_pair" "terraform" {
  key_name   = "terraform"
  public_key = "${file("keys/ami_keys.pub")}"
}
