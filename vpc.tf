# ✅ VPC Creation
resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr
}

# ✅ Public Subnet (for NAT Gateway)
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.public_subnet_cidr
  map_public_ip_on_launch = true
  availability_zone       = var.aws_az
}

# ✅ Private Subnet (for RDS)
resource "aws_subnet" "private_subnet" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.private_subnet_cidr
  map_public_ip_on_launch = false
  availability_zone       = var.aws_az
}
# ✅ Private Subnet 2
resource "aws_subnet" "private_subnet_2" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.rivate_subnet_2_cidr
  map_public_ip_on_launch = false
  availability_zone       = var.s_az_2
}

# ✅ Internet Gateway for Public Subnet
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my_vpc.id
}

# ✅ Public Route Table
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.my_vpc.id
}

resource "aws_route" "public_internet_access" {
  route_table_id         = aws_route_table.public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}

# ✅ Elastic IP for NAT Gateway
resource "aws_eip" "nat_eip" {
  domain = "vpc"
}

# ✅ NAT Gateway for Private Subnet
resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnet.id
}

# ✅ Private Route Table (Route via NAT Gateway)
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.my_vpc.id
}

resource "aws_route" "private_nat_access" {
  route_table_id         = aws_route_table.private_rt.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_gw.id
}

resource "aws_route_table_association" "private_assoc" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_rt.id
}

# ✅ Private Subnet Group for RDS
resource "aws_db_subnet_group" "private_db_subnet_group" {
  name       = "private-db-subnet-group"
  subnet_ids = [aws_subnet.private_subnet.id,aws_subnet.private_subnet_2.id]   # ✅ Sirf private subnet use hoga
}