locals {
  app_name = "ct-ak-api"
}

#resource "aws_iam_role" "lambda_role" {
#  name = "${local.app_name}-lambda-role"
#
#  assume_role_policy = jsonencode({
#    Version   = "2012-10-17"
#    Statement = [
#      {
#        Action    = "sts:AssumeRole"
#        Effect    = "Allow"
#        Principal = {
#          Service = "lambda.amazonaws.com"
#        }
#      }
#    ]
#  })
#}


module "api_lambda" {
  source = "terraform-aws-modules/lambda/aws"

  function_name = "ct_ak_hello_world_api"
  description   = "Says Hello World"
  handler       = "api-lambda-function"
  runtime       = "go1.x"

  create_package         = false
  local_existing_package = "${path.module}/api-lambda.zip"

  ignore_source_code_hash = true
}


#data "aws_iam_policy_document" "iam_policy_document" {
#
#  statement {
#    effect  = "Allow"
#    sid     = "CloudwatchLogsAccess"
#    actions = [
#      "logs:CreateLogGroup",
#      "logs:CreateLogStream",
#      "logs:PutLogEvents"
#    ]
#    resources = [
#      "arn:aws:logs:*:*:*"
#    ]
#  }
#
#}

#resource "aws_iam_policy" "lambda_policy" {
#  name   = "api_lambda_policy"
#  policy = data.aws_iam_policy_document.iam_policy_document.json
#}
#
#
#resource "aws_iam_role_policy_attachment" "lambda_logs" {
#  role       = aws_iam_role.lambda_role.name
#  policy_arn = aws_iam_policy.lambda_policy.arn
#}
