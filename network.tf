# VPC##########################################################################
resource "aws_vpc" "default" {
  cidr_block           = "${var.vpc_cidr_block}"
  enable_dns_hostnames = true

  tags {
    Name = "terraform-aws-vpc"
  }
}

# Gateway######################################################################
resource "aws_internet_gateway" "default" {
  vpc_id = "${aws_vpc.default.id}"
}

# Public subnet 1##############################################################
resource "aws_subnet" "public-One" {
  vpc_id                  = "${aws_vpc.default.id}"
  cidr_block              = "${var.public_cidr_block1}"
  map_public_ip_on_launch = true
  depends_on              = ["aws_internet_gateway.default"]
  availability_zone       = "${lookup(var.availability_zone,"primary")}"

  tags {
    Name = "Public Subnet One"
  }
}

resource "aws_route_table" "public-One-Route" {
  vpc_id = "${aws_vpc.default.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.default.id}"
  }

  tags {
    Name = "Public Subnet One"
  }
}

resource "aws_route_table_association" "public-Assoc-One" {
  subnet_id      = "${aws_subnet.public-One.id}"
  route_table_id = "${aws_route_table.public-One-Route.id}"
}

# Public subnet 2##############################################################
resource "aws_subnet" "public-Two" {
  vpc_id                  = "${aws_vpc.default.id}"
  cidr_block              = "${var.public_cidr_block2}"
  map_public_ip_on_launch = true
  depends_on              = ["aws_internet_gateway.default"]
  availability_zone       = "${lookup(var.availability_zone,"secondary")}"

  tags {
    Name = "Public Subnet Two"
  }
}

resource "aws_route_table" "public-Two-Route" {
  vpc_id = "${aws_vpc.default.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.default.id}"
  }

  tags {
    Name = "Public Subnet Two"
  }
}

resource "aws_route_table_association" "public-Assoc-Two" {
  subnet_id      = "${aws_subnet.public-Two.id}"
  route_table_id = "${aws_route_table.public-Two-Route.id}"
}

# Private subnet 1#############################################################
resource "aws_subnet" "private-One" {
  vpc_id            = "${aws_vpc.default.id}"
  cidr_block        = "${var.private_cidr_block1}"
  availability_zone = "${lookup(var.availability_zone,"primary")}"

  tags {
    Name = "Private Subnet One"
  }
}

resource "aws_route_table" "private-One-Route" {
  vpc_id = "${aws_vpc.default.id}"

  route {
    cidr_block  = "0.0.0.0/0"
    instance_id = "${aws_instance.bastion-eu-west1a.id}"
  }

  tags {
    Name = "Private Subnet One"
  }
}

resource "aws_route_table_association" "private-Assoc-One" {
  subnet_id      = "${aws_subnet.private-One.id}"
  route_table_id = "${aws_route_table.private-One-Route.id}"
}

# Private subnet 1#############################################################
resource "aws_subnet" "private-Two" {
  vpc_id            = "${aws_vpc.default.id}"
  cidr_block        = "${var.private_cidr_block2}"
  availability_zone = "${lookup(var.availability_zone,"secondary")}"

  tags {
    Name = "Private Subnet Two"
  }
}

resource "aws_route_table" "private-Two-Route" {
  vpc_id = "${aws_vpc.default.id}"

  route {
    cidr_block  = "0.0.0.0/0"
    instance_id = "${aws_instance.bastion-eu-west1b.id}"
  }

  tags {
    Name = "Private Subnet Two"
  }
}

resource "aws_route_table_association" "private-Assoc-Two" {
  subnet_id      = "${aws_subnet.private-Two.id}"
  route_table_id = "${aws_route_table.private-Two-Route.id}"
}
