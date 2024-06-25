terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }

  backend "s3" {
    region = var.primary_region
    key    = "terraform.tfstate"
  }
}

provider "aws" {
  region = var.primary_region
}

resource "aws_instance" "test_instance" {
  ami           = "ami-830c94e3"
  instance_type = "t2.nano"
  tags = {
    Name = "test_instance"
  }
}

# module "appsync_api" {
#   source = "./modules"
#   region = var.reg
# }
