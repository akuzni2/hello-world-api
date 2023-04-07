terraform {
  backend "s3" {
    bucket         = "ct-ak-api-us-east-1-tf-state"
    key            = "dev/us-east-1/terraform.tfstate"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
    region         = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      environment = var.environment
    }
  }
}
