environment = "dev"
aws_region  = "us-east-1"

tags = {
  project     = "cointracker-demo"
  application = "helloworld-api"
  environment = "dev"
}

# set false after init - deploy lambda updates from CICD pipeline
initialize_lambda_empty = true
