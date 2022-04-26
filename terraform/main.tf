provider "aws" {
  region = "us-east-1"
}
 
resource "aws_vpc" "demo_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    name = "demo_vpc"
  }
}
resource "aws_subnet" "demo_subnet-1" {
  vpc_id = aws_vpc.demo_vpc.id
  cidr_block = "10.0.0.0/24"
  availability_zone = "us-east-1a"
  tags = {
    name = "demo_subnet"
  }
}
data "aws_vpc" "existing_vpc"{
  default = true
}

resource "aws_subnet" "demo_subnet-2" {
  vpc_id = data.aws_vpc.existing_vpc.id
  cidr_block = "172.31.96.0/20"
  availability_zone = "us-east-1a"
}