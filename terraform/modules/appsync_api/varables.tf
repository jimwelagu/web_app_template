variable "region" {
  description = "The AWS region"
  type        = string
}

variable "schema_path" {
  description = "The AWS region"
  type        = string
  default = abspath("${path.module}/../../../../schema.graphql")
}