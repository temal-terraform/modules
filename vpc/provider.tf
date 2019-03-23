provider "aws" {
  region  = "eu-central-1"
  version = "~> 1.39.0"
}

terraform {
  # The configuration for this backend will be filled in by Terragrunt
  backend "s3" {}
}
