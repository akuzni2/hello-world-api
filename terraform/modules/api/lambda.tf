locals {
  app_name = "cointracker-api"
}

resource "aws_iam_role" "lambda_role" {
  name = "${local.app_name}-lambda-role"

  assume_role_policy = jsonencode({
    Version   = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Effect    = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

# only used to initialize
data "archive_file" "dummy" {
  type        = "zip"
  output_path = "${path.module}/api-lambda.zip"
}

resource "aws_lambda_function" "api_lambda" {
  function_name = "ct_ak_hello_world_api"
  description   = "Says Hello World"
  handler       = "api-lambda-function"
  runtime       = "go1.x"
  role          = aws_iam_role.lambda_role.arn
  filename      = var.initialize_lambda_empty ? data.archive_file.dummy : null

  lifecycle {
    ignore_changes = [
      "filename",
    ]
  }
}

// log group
resource "aws_cloudwatch_log_group" "example" {
  name              = "/aws/lambda/${aws_lambda_function.api_lambda.function_name}"
  retention_in_days = 14
}

data "aws_iam_policy_document" "iam_policy_document" {

  statement {
    effect  = "Allow"
    sid     = "CloudwatchLogsAccess"
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ]
    resources = [
      "arn:aws:logs:*:*:*"
    ]
  }

}

resource "aws_iam_policy" "reminder_lambda_policy" {
  name   = "mr_reminder_lambda_policy"
  policy = data.aws_iam_policy_document.iam_policy_document.json
}


resource "aws_iam_role_policy_attachment" "lambda_logs" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.reminder_lambda_policy.arn
}
