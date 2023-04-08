# cointracker-hello-world

## Immediate Demo of Working API
```bash
curl https://xfe2ggc5xh.execute-api.us-east-1.amazonaws.com/v1/hello-world
```

I wasn't able to get DNS + Domain Name Provisioned to give it a better name.


# Components Covered

- API Gateway for routing traffic to lambda function
- AWS Lambda Function as deployable artifact (Go executable)
- IAM Role for Github Actions to allow minimum deployment privileges
- IAM Role for Lambda to allow minimum privileges to other resources
- Terraform to manage infrastructure
- Github Actions to build and deploy terraform to AWS
- Go to create a very small + fast deployable lambda function artifact to return the payload

# Small Todo + Improvements
- Route53 Domain Name + ACM Certificate
- Restrict API traffic with API Key + configure throttling
- Request Latency + Error monitoring
- Implement some centralizd logging

# Deployment Steps

Step 0. Be in the AWS Account of the environment to set this up (Dev, Stg, Prd, etc..)
Step 1. Provision a Temporary User
Step 2. Provision Yourself Temporary AWS Secret Keys locally and destroy after use. 
These steps are only required to be ran once per environment. From then on the Github Actions
Pipeline will do all the deployment to AWS Environments.

# Preliminary Resources Required

### DynamoDB State Lock Table

Example:
```bash
aws dynamodb create-table \
  --table-name terraform-state-lock \
  --attribute-definitions AttributeName=LockID,AttributeType=S \
  --key-schema AttributeName=LockID,KeyType=HASH \
  --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
  --tags Key=Environment,Value=development
```

### S3 State File Bucket
Replace bucket name - and configure the same bucket name in the terraform workspaces environment providers file.

Example:
```bash
aws s3api put-bucket-versioning \
  --bucket ct-ak-api-us-east-1-tf-state \
  --versioning-configuration Status=Enabled
```




