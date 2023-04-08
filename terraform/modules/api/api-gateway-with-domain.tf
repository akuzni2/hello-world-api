# TODO - complete once purchase a new domain name

#module "api_gateway" {
#  source        = "terraform-aws-modules/apigateway-v2/aws"
#  version       = "2.2.2"
#  name          = "ct-ak-api-hello-world-http"
#  description   = "My API"
#  protocol_type = "HTTP"
#
#  cors_configuration = {
#    allow_headers = [
#      "content-type", "x-amz-date", "authorization", "x-api-key", "x-amz-security-token", "x-amz-user-agent"
#    ]
#    allow_methods = ["*"]
#    allow_origins = ["*"]
#  }
#
##  domain_name                 = local.domain_name
##  domain_name_certificate_arn = module.acm.acm_certificate_arn
#
#  default_route_settings = {
#    detailed_metrics_enabled = true
#    throttling_burst_limit   = 100
#    throttling_rate_limit    = 100
#  }
#
#  integrations = {
#
#    "ANY /" = {
#      lambda_arn             = module.api_lambda.lambda_function_arn
#      payload_format_version = "2.0"
#      timeout_milliseconds   = 12000
#    }
#
#    "$default" = {
#      lambda_arn = module.api_lambda.lambda_function_arn
#      tls_config = jsonencode({
#        server_name_to_verify = local.domain_name
#      })
#
#    }
#
#  }
#
#  tags = var.tags
#}