variable "region" {
  description = "The AWS region"
  type        = string
}

variable "schema_path" {
  type        = string
}

variable "get_task_resolver" {
  type        = string
}

variable "add_task_zip" {
  type        = string
}

variable "post_confirmation_zip" {
  type        = string
}