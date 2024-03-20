module "instances" {
  source = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 2.0"

  name           = "example-instance"
  instance_count = 2
  ami            = "ami-0c55b159cbfafe1f0"
  instance_type  = "t2.micro"
  key_name       = "example-keypair"
  subnet_id      = module.vpc.public_subnets[0]
  security_groups = ["${module.vpc.default_security_group_id}"]
  user_data      = file("${path.module}/scripts/user_data.sh")
  tags = {
    "Environment" = "example"
  }
}

