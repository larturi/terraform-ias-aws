variable "vpc_tags" {
  description = "Tags for VPC"
  type        = map(any)
}

variable "availability_zones" {
  description = "AZs for subnets"
  type        = list(string)
}

variable "public_subnet_cidrs" {
  description = "CIDRs for public subnets"
  type        = list(string)
}
