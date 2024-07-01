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
  add_task_zip          = abspath("../built_server/add_task_lambda_function.zip")
  post_confirmation_zip = abspath("../built_server/post_confirmation_lambda_function.zip")
}

module "react_ui" {
  source      = "./modules/react_ui"
  region      = var.region
  bucket_name = "${var.region}-new-gql-client"
  client_path = abspath("../built_client/build/")
}

# Output the S3 bucket domain name
output "s3_bucket_domain_name" {
  value = module.react_ui.s3_bucket_bucket_regional_domain_name
}

# Output the CloudFront domain name
output "cloudfront_domain_name" {
  value = module.react_ui.cloudfront_distribution_domain_name
}

# Output the CloudFront distribution ID
output "cloudfront_distribution_id" {
  value = module.react_ui.cloudfront_distribution_id
}
