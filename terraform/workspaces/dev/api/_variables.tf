variable "aws_region" {
  description = "The primary AWS region"
  type        = string
}

variable "environment" {
  description = "The release environment to deploy"
  type        = string
}

variable "tags" {
  description = "Map of AWS resource tags"
  type        = map(any)
  default     = {}
}

variable "initialize_lambda_empty" {
  description = "Init lambda (chicken/egg) problem"
  type        = bool
}
