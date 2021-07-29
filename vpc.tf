# Create VPC
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc-cidr
  instance_tenancy     = "default"
  enable_dns_hostnames = true

  tags = {
    Name = "Main VPC"
  }
}

# Create internet gateway and attach to VPC
resource "aws_internet_gateway" "internet-gateway" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "Main Internet Gateway"
  }
}

# Create public subnet 1
resource "aws_subnet" "public-subnet-1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public-subnet-1-cidr
  availability_zone       = var.availability-zone
  map_public_ip_on_launch = true

  tags = {
    Name = "Public Subnet 1"
  }
}

# Create route table and route for public subnet 1
resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet-gateway.id
  }

  tags = {
    Name = "Public Route Table"
  }
}

# Associate route table with public subnet 1
resource "aws_route_table_association" "public-subnet-1-assoc" {
  subnet_id      = aws_subnet.public-subnet-1.id
  route_table_id = aws_route_table.public-route-table.id
}

# Create private subnet 1
resource "aws_subnet" "private-subnet-1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.private-subnet-1-cidr
  availability_zone       = var.availability-zone
  map_public_ip_on_launch = false

  tags = {
    Name = "Private Subnet 1"
  }
}

# Create private subnet 2
resource "aws_subnet" "private-subnet-2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.private-subnet-2-cidr
  availability_zone       = var.availability-zone
  map_public_ip_on_launch = false

  tags = {
    Name = "Private Subnet 2"
  }
}
