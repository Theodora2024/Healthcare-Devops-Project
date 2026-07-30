resource "aws_vpc" "this" {

  cidr_block = var.vpc_cidr

  enable_dns_support = true

  enable_dns_hostnames = true

  tags = var.common_tags

}
resource "aws_internet_gateway" "this" {

  vpc_id = aws_vpc.this.id

  tags = var.common_tags

}
resource "aws_subnet" "public_1" {

  vpc_id = aws_vpc.this.id

  cidr_block = var.public_subnet_cidrs[0]

  availability_zone = var.availability_zones[0]

  map_public_ip_on_launch = true

  tags = var.common_tags

}
resource "aws_subnet" "public_2" {

  vpc_id = aws_vpc.this.id

  cidr_block = var.public_subnet_cidrs[1]

  availability_zone = var.availability_zones[1]

  map_public_ip_on_launch = true

  tags = var.common_tags

}
resource "aws_subnet" "private_1" {

  vpc_id = aws_vpc.this.id

  cidr_block = var.private_subnet_cidrs[0]

  availability_zone = var.availability_zones[0]

  tags = var.common_tags
}
resource "aws_subnet" "private_2" {

  vpc_id = aws_vpc.this.id

  cidr_block = var.private_subnet_cidrs[1]

  availability_zone = var.availability_zones[1]

  tags = var.common_tags

}
resource "aws_eip" "nat" {

  domain = "vpc"

  tags = var.common_tags

}
resource "aws_nat_gateway" "this" {

  allocation_id = aws_eip.nat.id

  subnet_id = aws_subnet.public_1.id

  depends_on = [
    aws_internet_gateway.this
  ]

  tags = var.common_tags

}
resource "aws_route_table" "public" {

  vpc_id = aws_vpc.this.id

  route {

    cidr_block = "0.0.0.0/0"

    gateway_id = aws_internet_gateway.this.id

  }

  tags = var.common_tags
}
resource "aws_route_table" "private" {

  vpc_id = aws_vpc.this.id

  route {

    cidr_block = "0.0.0.0/0"

    nat_gateway_id = aws_nat_gateway.this.id

  }

  tags = var.common_tags

}
resource "aws_route_table_association" "public_1" {

  subnet_id = aws_subnet.public_1.id

  route_table_id = aws_route_table.public.id

}

resource "aws_route_table_association" "public_2" {

  subnet_id = aws_subnet.public_2.id

  route_table_id = aws_route_table.public.id

}
resource "aws_route_table_association" "private_1" {

  subnet_id = aws_subnet.private_1.id

  route_table_id = aws_route_table.private.id

}

resource "aws_route_table_association" "private_2" {

  subnet_id = aws_subnet.private_2.id

  route_table_id = aws_route_table.private.id

}