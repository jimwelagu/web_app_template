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

module "appsync_api" {
  source                = "./modules/appsync_api"
  region                = var.region
  schema_path           = abspath("../schema.graphql")
  get_task_resolver     = abspath("../server/resolvers/getTasks.js")
  add_task_zip          = abspath("../built_functions/add_task_lambda_function.zip")
  post_confirmation_zip = abspath("../built_functions/post_confirmation_lambda_function.zip")
}

module "name" {
  source      = "./modules/react_ui"
  region      = var.region
  bucket_name = "${var.region}-new-gql-client"
}
