
# TODO see why not working later. Stage being created was timing out

#locals {
#  domain_name = "ak-ct-demo.link"
#}
#
#data "aws_route53_zone" "my_zone" {
#  name = local.domain_name
#}
#
#module "acm" {
#  source  = "terraform-aws-modules/acm/aws"
#  version = "~> 3.0"
#
#  domain_name = local.domain_name
#  zone_id     = data.aws_route53_zone.my_zone.id
#}
#
#
#resource "aws_apigatewayv2_domain_name" "hello_world_api" {
#  domain_name = local.domain_name
#  domain_name_configuration {
#    certificate_arn = module.acm.acm_certificate_arn
#    endpoint_type   = "REGIONAL"
#    security_policy = "TLS_1_2"
#  }
#}
#
#resource "aws_route53_record" "record" {
#  zone_id = data.aws_route53_zone.my_zone.id
#  name    = "www.${local.domain_name}"
#  type    = "A"
#
#  alias {
#    name                   = aws_apigatewayv2_domain_name.hello_world_api.domain_name_configuration.0.target_domain_name
#    zone_id                = aws_apigatewayv2_domain_name.hello_world_api.domain_name_configuration.0.hosted_zone_id
#    evaluate_target_health = false
#  }
#}
#
#resource "aws_apigatewayv2_api_mapping" "example" {
#  api_id      = aws_apigatewayv2_api.hello_world_api.id
#  domain_name = aws_apigatewayv2_domain_name.hello_world_api.id
#  stage       = aws_apigatewayv2_stage.hello_world_api.id
#}