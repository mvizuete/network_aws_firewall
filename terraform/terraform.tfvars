
tags_project = {
  "env"         = "dev"
  "owner"       = "mvizuete"
  "cloud"       = "aws"
  "IAC"         = "Terraform"
  "IAC_Version" = "1.3.6"
  "project"     = "aws_security_01"
  "region"      = "virginia"
}

vpc_parameters = {
  "vpc_cidr"                               = "10.1.0.0/16"
  "public_subnet_cidr"                     = "10.1.0.0/24"
  "private_subnet_cidr"                    = "10.1.1.0/24"
  "firewall_subnet_cidr"                   = "10.1.2.0/24"
  "availability_zone_public_subnet_cidr"   = "us-east-1a"
  "availability_zone_private_subnet_cidr"  = "us-east-1b"
  "availability_zone_firewall_subnet_cidr" = "us-east-1c"
}

sg_ingress_cidr = "0.0.0.0/0"

