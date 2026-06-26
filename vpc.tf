
resource "aws_vpc" "assesment" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "assesment-vpc"
  }
}

# Internet Gateway for public subnets
resource "aws_internet_gateway" "assesment" {
  vpc_id = aws_vpc.assesment.id

  tags = {
    Name = "assesment-igw"
  }
}

# Public Subnets
resource "aws_subnet" "public1" {
  vpc_id            = aws_vpc.assesment.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  map_public_ip_on_launch = true

  tags = {
    Name = "assesment-public-subnet-1"
  }
}
resource "aws_subnet" "public2" {
  vpc_id            = aws_vpc.assesment.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"

  map_public_ip_on_launch = true

  tags = {
    Name = "assesment-public-subnet-2"
  }
}
# Route Tables
resource "aws_route_table" "assesment-rt" {
  vpc_id = aws_vpc.assesment.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.assesment.id
  }

  tags = {
    Name = "assesment-public-rt"
  }
}

# Route Table Associations
resource "aws_route_table_association" "public-1" {
  subnet_id      = aws_subnet.public1.id
  route_table_id = aws_route_table.assesment-rt.id
}

resource "aws_route_table_association" "public-2" {
  subnet_id      = aws_subnet.public2.id
  route_table_id = aws_route_table.assesment-rt.id
}
resource "aws_security_group" "assesment-sg" {
  name        = "assesment-sg"
  description = "Security group for web servers"
  vpc_id      = aws_vpc.assesment.id
  
  ingress {
    description = "allow all"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
   egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = { Name = "assesment-sg" }
}
