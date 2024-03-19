# kubernetes.tf

provider "aws" {
  region = "us-west-2" # Your region
}

resource "aws_eks_cluster" "kube" {
  name     = "kubernetes-cluster"
  role_arn = aws_iam_role.example.arn

  vpc_config {
    subnet_ids = ["subnet-12345678", "subnet-87654321"] # Your subnets
  }
}

resource "aws_iam_role" "kube" {
  name = "kube-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect    = "Allow"
      Principal = {
        Service = "eks.amazonaws.com"
      }
      Action    = "sts:AssumeRole"
    }]
  })
}

