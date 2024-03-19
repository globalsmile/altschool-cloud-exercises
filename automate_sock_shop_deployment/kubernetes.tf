# kubernetes.tf

provider "aws" {
  region = var.region
}

resource "aws_eks_cluster" "kube" {
  name     = var.cluster_name
  role_arn = aws_iam_role.kube.arn

  vpc_config {
    subnet_ids = var.subnet_ids
  }
}

resource "aws_iam_role" "kube" {
  name = var.role_name

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

