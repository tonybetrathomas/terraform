resource "aws_subnet" "aws-public-subnet" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public-subnet-cidr_block
  map_public_ip_on_launch = true
  availability_zone       = element(var.availability_zones, count.index)
  tags = {
    Name = "${var.vpc_name}-public-subnet-${count.index}"
  }
}

resource "aws_subnet" "aws-private-subnet" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.private-subnet-cidr_block
  map_public_ip_on_launch = false
  availability_zone       = element(var.availability_zones, count.index)
  tags = {
    Name = "${var.vpc_name}-private-subnet-${count.index}"
  }
}
