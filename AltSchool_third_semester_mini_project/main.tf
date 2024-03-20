terraform {
  required_version = ">= 0.12"
}

provider "aws" {
  region = var.region
}

module "vpc" {
  source = "./vpc"
  // Pass variables for VPC module if needed
}

module "instances" {
  source = "./instances"
  // Pass variables for instances module if needed
}


