# TODO - complete once purchase a new domain name

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
#resource "aws_route53_record" "api" {
#  zone_id = data.aws_route53_zone.my_zone.zone_id
#  type    = "A"
#
#  alias {
#    name                   = module.api_gateway.apigatewayv2_domain_name_configuration[0].target_domain_name
#    zone_id                = module.api_gateway.apigatewayv2_domain_name_configuration[0].hosted_zone_id
#    evaluate_target_health = false
#  }
#  name = "www.ak-ct-demo.link"
#}
