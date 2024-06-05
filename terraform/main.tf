



module "vpc" {
  source                                 = "./modules/vpc"
  vpc_cidr                               = var.vpc_parameters.vpc_cidr
  public_subnet_cidr                     = var.vpc_parameters.public_subnet_cidr
  private_subnet_cidr                    = var.vpc_parameters.private_subnet_cidr
  firewall_subnet_cidr                   = var.vpc_parameters.firewall_subnet_cidr
  availability_zone_public_subnet_cidr   = var.vpc_parameters.availability_zone_public_subnet_cidr
  availability_zone_private_subnet_cidr  = var.vpc_parameters.availability_zone_private_subnet_cidr
  availability_zone_firewall_subnet_cidr = var.vpc_parameters.availability_zone_firewall_subnet_cidr
  tags                                   = var.tags_project
  sg_ingress_cidr                        = var.sg_ingress_cidr
}


