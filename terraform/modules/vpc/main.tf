
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    "Name" = "VPC-${local.sufix}"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = var.availability_zone_public_subnet_cidr
  map_public_ip_on_launch = true
  tags = {
    "Name" = "Public_Subnet-${local.sufix}"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.private_subnet_cidr
  availability_zone       = var.availability_zone_private_subnet_cidr
  map_public_ip_on_launch = true
  tags = {
    "Name" = "Private_Subnet-${local.sufix}"
  }
}

resource "aws_subnet" "firewall_subnet" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.firewall_subnet_cidr
  availability_zone = var.availability_zone_firewall_subnet_cidr
  tags = {
    "Name" = "Firewall_Subnet-${local.sufix}"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "igw_vpc-${local.sufix}"
  }
}

resource "aws_route_table" "public_crt" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "Public_crt-${local.sufix}"
  }
}

resource "aws_route_table_association" "crta_public_subnet" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_crt.id
}

resource "aws_security_group" "sg_public_subnet" {
  name        = "Public Subnet SG-${local.sufix}"
  description = "Public Subnet Security Group"
  vpc_id      = aws_vpc.vpc.id
  tags = {
    Name = "Public Subnet SG-${local.sufix}"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_ingress_traffic_ipv4" {
  security_group_id = aws_security_group.sg_public_subnet.id
  cidr_ipv4         = var.sg_ingress_cidr
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
  tags = {
    Name = "Allow SSH ingress rule-${local.sufix}"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_all_ingress_traffic_in_public_subnet" {
  security_group_id = aws_security_group.sg_public_subnet.id
  cidr_ipv4         = var.public_subnet_cidr
  ip_protocol       = "-1" # semantically equivalent to all ports
  tags = {
    Name = "Allow all traffic public subnet ingress rule-${local.sufix}"
  }
}

resource "aws_vpc_security_group_egress_rule" "allow_all_egress_traffic_ipv4" {
  security_group_id = aws_security_group.sg_public_subnet.id
  cidr_ipv4         = var.sg_ingress_cidr
  ip_protocol       = "-1" # semantically equivalent to all ports
  tags = {
    Name = "Allow all ipv4 traffic public subnet egress rule-${local.sufix}"
  }
}

resource "aws_security_group" "sg_private_subnet" {
  name        = "Public Private SG-${local.sufix}"
  description = "Private Subnet Security Group"
  vpc_id      = aws_vpc.vpc.id
  tags = {
    Name = "Private Subnet SG-${local.sufix}"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_all_traffic_from_public_subnet" {
  security_group_id = aws_security_group.sg_private_subnet.id
  cidr_ipv4         = var.public_subnet_cidr
  ip_protocol       = "-1" # semantically equivalent to all ports
  tags = {
    Name = "Allow all traffic from public subnet ingress rule-${local.sufix}"
  }
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_to_public_subnet" {
  security_group_id = aws_security_group.sg_private_subnet.id
  cidr_ipv4         = var.public_subnet_cidr
  ip_protocol       = "-1" # semantically equivalent to all ports
  tags = {
    Name = "Allow all traffic from public subnet egress rule-${local.sufix}"
  }
}
