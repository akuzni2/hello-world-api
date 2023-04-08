locals {
  domain_name = "ak-ct-demo.link"
}

data "aws_route53_zone" "my_zone" {
  name = local.domain_name
}

module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "~> 3.0"

  domain_name = local.domain_name
  zone_id     = data.aws_route53_zone.my_zone.id
}

resource "aws_route53_record" "example" {
  zone_id = data.aws_route53_zone.my_zone.id
  name    = "www.${local.domain_name}"
  type    = "A"
}
