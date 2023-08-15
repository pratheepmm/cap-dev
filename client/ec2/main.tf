module "vpc-and-subnets" {
  source = "../vpc-and-subnets"
}

module "ec2_instance_1" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "instance-1"

  ami                    = "ami-0ccabb5f82d4c9af5"
  instance_type          = "t2.micro"
  monitoring             = true
  subnet_id              = module.vpc-and-subnets.private-subnets[0]
  associate_public_ip_address = false

  tags = {
    Team = "Avengers",
    Org  = "Cap-Dev"
  }
}

module "ec2_instance_2" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "instance-2"

  ami                    = "ami-0ccabb5f82d4c9af5"
  instance_type          = "t2.micro"
  monitoring             = true
  subnet_id              = module.vpc-and-subnets.private-subnets[1]
  associate_public_ip_address = false

  tags = {
    Team = "Avengers",
    Org  = "Cap-Dev"
  }
}
