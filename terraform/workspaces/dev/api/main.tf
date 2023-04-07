module "video_ingest_nextgen" {
  source = "../../../modules/api"

  environment = var.environment
  tags       = merge(var.tags)
  aws_region = "us-east-1"

}
