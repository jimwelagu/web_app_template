terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }

  backend "s3" {
    region = "us-west-2"
    key    = "terraform.tfstate"
  }
}

provider "aws" {
  region = var.region
}

resource "aws_instance" "test_instance" {
  ami           = "ami-830c94e3"
  instance_type = "t2.nano"
  tags = {
    Name = "test_instance"
  }
}

module "appsync_api" {
  source            = "./modules/appsync_api"
  region            = var.region
  schema_path       = abspath("../schema.graphql")
  get_task_resolver = abspath("../resolvers/getTasks.js")
}
