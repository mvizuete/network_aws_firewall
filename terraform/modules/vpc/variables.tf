
variable "tags" {
  description = "Tags del proyecto"
  type        = map(string)
}

variable "vpc_cidr" {
  description = "CIDR Virginia"
  type        = string
  #   sensitive   = true
}

variable "public_subnet_cidr" {
  description = "CIDR public subnet"
  type        = string
  #   sensitive   = true
}

variable "availability_zone_public_subnet_cidr" {
  description = "Availability Zone public subnet"
  type        = string
  #   sensitive   = true
}

variable "private_subnet_cidr" {
  description = "CIDR private subnet"
  type        = string
  #   sensitive   = true
}

variable "availability_zone_private_subnet_cidr" {
  description = "Availability Zone private subnet"
  type        = string
  #   sensitive   = true
}

variable "firewall_subnet_cidr" {
  description = "CIDR firewall subnet"
  type        = string
  #   sensitive   = true
}

variable "availability_zone_firewall_subnet_cidr" {
  description = "Availability Zone firewall subnet"
  type        = string
  #   sensitive   = true
}

variable "sg_ingress_cidr" {
  description = "Security Group ingress CIDR"
  type        = string
  #   sensitive   = true
}
