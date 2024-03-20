module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 3.0"

  name                 = "example-vpc"
  cidr                 = "10.0.0.0/16"
  azs                  = ["eu-west-1a", "eu-west-1b", "eu-west-1c", "eu-central-1a", "eu-central-1b", "eu-central-1c"]
  private_subnets      = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  public_subnets       = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24", "10.0.104.0/24", "10.0.105.0/24", "10.0.106.0/24"]
  enable_nat_gateway   = true
  single_nat_gateway   = true
  public_subnet_tags   = { "Environment" : "example" }
  private_subnet_tags  = { "Environment" : "example" }
  instance_tenancy     = "default"
}

