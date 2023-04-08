module "cointracker_api" {
  source = "../../../modules/api"

  environment = var.environment
  tags        = merge(var.tags)
  aws_region  = "us-east-1"

  initialize_lambda_empty = var.initialize_lambda_empty
}
