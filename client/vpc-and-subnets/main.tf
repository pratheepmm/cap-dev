module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "marvel"
  cidr = "10.0.0.0/23"

  azs             = ["us-east-2a", "us-east-2b"]
  public_subnets  = ["10.0.0.0/27", "10.0.0.32/27"]
  private_subnets = ["10.0.1.0/27", "10.0.1.32/27"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  single_nat_gateway = false
  one_nat_gateway_per_az = true

  tags = {
    Terraform = "true"
    Environment = "dev"
    Team = "Avengers"
  }
}