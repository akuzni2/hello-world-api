module "s3_lambda_archive" {
  source                               = "terraform-aws-modules/s3-bucket/aws"
  version                              = "1.17.0"
  server_side_encryption_configuration = {
    rule = {
      apply_server_side_encryption_by_default = {
        sse_algorithm = "AES256"
      }
    }
  }

  bucket = "ct-ak-api-lambda-archive-${var.environment}"
  acl    = "private"

  versioning = {
    enabled = true
  }

  tags = merge(var.tags)
}