provider "aws" {
  #access_key = "${var.aws_access_key}"
  #secret_key = "${var.aws_secret_key}"
  shared_credentials_file = "${var.credentialsfile}"
  region     = "${var.Region}"
}
resource "aws_vpc" "terraformmain" {
    cidr_block = "${var.VPC-CDIR}"
   #### this 2 true values are for use the internal vpc dns resolution
    enable_dns_support = true
    enable_dns_hostnames = true
    tags {
      Name = "Terraform vpc"
    }
}
resource "aws_subnet" "PublicAZ1" {
  vpc_id = "${aws_vpc.terraformmain.id}"
  cidr_block = "${var.Public-Subnet-AZ1}"
  tags {
        Name = "PublicAZ1"
  }
 availability_zone = "${data.aws_availability_zones.available.names[0]}"
}
resource "aws_route_table_association" "PublicAZ1" {
    subnet_id = "${aws_subnet.PublicAZ1.id}"
    route_table_id = "${aws_route_table.public.id}"
}
resource "aws_subnet" "PrivateAZ1" {
  vpc_id = "${aws_vpc.terraformmain.id}"
  cidr_block = "${var.Private-Subnet-AZ1}"
  tags {
        Name = "PublicAZB"
  }
  availability_zone = "${data.aws_availability_zones.available.names[1]}"
}
resource "aws_route_table_association" "PrivateAZ1" {
    subnet_id = "${aws_subnet.PrivateAZ1.id}"
    route_table_id = "${aws_route_table.private.id}"
}
# Declare the data source
data "aws_availability_zones" "available" {}

/* EXTERNAL NETWORG , IG, ROUTE TABLE */
resource "aws_internet_gateway" "gw" {
   vpc_id = "${aws_vpc.terraformmain.id}"
    tags {
        Name = "internet gw terraform generated"
    }
}
resource "aws_network_acl" "all" {
   vpc_id = "${aws_vpc.terraformmain.id}"
    egress {
        protocol = "-1"
        rule_no = 2
        action = "allow"
        cidr_block =  "0.0.0.0/0"
        from_port = 0
        to_port = 0
    }
    ingress {
        protocol = "-1"
        rule_no = 1
        action = "allow"
        cidr_block =  "0.0.0.0/0"
        from_port = 0
        to_port = 0
    }
    tags {
        Name = "open acl"
    }
}
resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.terraformmain.id}"
  tags {
      Name = "Public"
  }
  route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.gw.id}"
    }
}
resource "aws_route_table" "private" {
  vpc_id = "${aws_vpc.terraformmain.id}"
  tags {
      Name = "Private"
  }
  route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = "${aws_nat_gateway.PublicAZ1.id}"
  }
}
resource "aws_eip" "forNat" {
    vpc      = true
}
resource "aws_nat_gateway" "PublicAZ1" {
    allocation_id = "${aws_eip.forNat.id}"
    subnet_id = "${aws_subnet.PublicAZ1.id}"
    depends_on = ["aws_internet_gateway.gw"]
}