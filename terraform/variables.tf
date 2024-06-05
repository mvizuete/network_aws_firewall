
variable "vpc_parameters" {
  description = "VPC parameter"
  type        = map(string)
}

variable "tags_project" {
  description = "Tags project"
  type        = map(string)
}

variable "sg_ingress_cidr" {
  description = "CIDR for ingress traffic"
  type        = string
}
