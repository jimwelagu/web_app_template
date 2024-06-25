terraform {
  backend "s3" {
    bucket                  = "terraform-s3-state-2024"
    key                     = "web_app_template"
    region                  = "us-west-2"
    # shared_credentials_file = "~/.aws/credentials"
  }
}

provider "aws" {
  region                  = "us-west-2"
#   shared_credentials_file = "~/.aws/credentials"
}

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
 region = "us-west-2"
}
 
resource "aws_instance" "test_instance" {
 ami           = "ami-830c94e3"
 instance_type = "t2.nano"
 tags = {
   Name = "test_instance"
 }
}