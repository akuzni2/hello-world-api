locals {
  app_name = "ct-ak-api"
}

module "api_lambda" {
  source = "terraform-aws-modules/lambda/aws"

  function_name = "ct_ak_hello_world_api"
  description   = "Says Hello World"
  handler       = "api-lambda-function"
  runtime       = "go1.x"

  create_package         = false
  local_existing_package = "${path.module}/api-lambda-initial.zip"

  ignore_source_code_hash = true
  tags                    = var.tags
}
