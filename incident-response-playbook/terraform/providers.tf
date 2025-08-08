provider "aws" {
  region = var.region
}

# Helpful data sources
data "aws_caller_identity" "current" {}
data "aws_region" "current" {}