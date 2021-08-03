# Allocate Elastic IP Address (EIP1)
resource "aws_eip" "eip-for-nat-gateway-1" {
  vpc = true

  tags = {
    Name = "EIP for NAT 1"
  }
}

# Allocate Elastic IP Address (EIP2)
resource "aws_eip" "eip-for-nat-gateway-2" {
  vpc = true

  tags = {
    Name = "EIP for NAT 2"
  }
}

# Create Nat Gateway 1 in public subnet 1
resource "aws_nat_gateway" "nat-gateway-1" {
  subnet_id     = aws_subnet.public-subnet-1.id
  allocation_id = aws_eip.eip-for-nat-gateway-1.id

  tags = {
    Name = "NAT Gateway Public Subnet 1"
  }
}

# Create Nat Gateway 2 in public subnet 2
resource "aws_nat_gateway" "nat-gateway-2" {
  subnet_id     = aws_subnet.public-subnet-2.id
  allocation_id = aws_eip.eip-for-nat-gateway-2.id

  tags = {
    Name = "NAT Gateway Public Subnet 2"
  }
}

# Create private route table for NAT Gateway 1
resource "aws_route_table" "private-route-table-for-nat-gateway-1" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-gateway-1.id
  }

  tags = {
    Name = "Private Route Table for NAT Gateway 1"
  }
}

# Associate private route table for NAT Gateway 1 with private subnet 1
resource "aws_route_table_association" "private-subnet-1-assoc" {
  subnet_id      = aws_subnet.private-subnet-1.id
  route_table_id = aws_route_table.private-route-table-for-nat-gateway-1.id
}

# Associate private route table for NAT Gateway 1 with private subnet 2
resource "aws_route_table_association" "private-subnet-2-assoc" {
  subnet_id      = aws_subnet.private-subnet-2.id
  route_table_id = aws_route_table.private-route-table-for-nat-gateway-1.id
}

# Create private route table for NAT Gateway 2
resource "aws_route_table" "private-route-table-for-nat-gateway-2" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-gateway-2.id
  }

  tags = {
    Name = "Private Route Table for NAT Gateway 2"
  }
}

# Associate private route table for NAT Gateway 2 with private subnet 3
resource "aws_route_table_association" "private-subnet-3-assoc" {
  subnet_id      = aws_subnet.private-subnet-3.id
  route_table_id = aws_route_table.private-route-table-for-nat-gateway-2.id
}

# Associate private route table for NAT Gateway 1 with private subnet 4
resource "aws_route_table_association" "private-subnet-4-assoc" {
  subnet_id      = aws_subnet.private-subnet-4.id
  route_table_id = aws_route_table.private-route-table-for-nat-gateway-2.id
}
