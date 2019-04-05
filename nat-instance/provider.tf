provider "aws" {
  region  = "eu-central-1"
  version = "~> 1.39.0"
}

terraform {
  backend "s3" {}
}
