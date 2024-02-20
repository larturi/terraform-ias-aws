# Create a VPC
resource "aws_vpc" "lnaVPC" {
  cidr_block = local.vpc_cidr
  tags       = var.vpc_tags
}

resource "aws_internet_gateway" "lnaIGW" {
  vpc_id = aws_vpc.lnaVPC.id
  tags = {
    Name    = "lnaIGW",
    Project = "LNA TF Demo"
  }
}

resource "aws_eip" "lnaNatGatewayEIP1" {
  tags = {
    Name    = "lnaNatGatewayEIP1",
    Project = "LNA TF Demo"
  }
}

resource "aws_nat_gateway" "lnaNatGateway1" {
  allocation_id = aws_eip.lnaNatGatewayEIP1.id
  subnet_id     = aws_subnet.lnaPublicSubnet1.id
  tags = {
    Name    = "lnaNatGateway1",
    Project = "LNA TF Demo"
  }
}

resource "aws_subnet" "lnaPublicSubnet1" {
  vpc_id            = aws_vpc.lnaVPC.id
  cidr_block        = var.public_subnet_cidrs[0]
  availability_zone = var.availability_zones[0]
  tags = {
    Name    = "lnaPublicSubnet1",
    Project = "LNA TF Demo"
  }
}
