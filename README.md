# cointracker-hello-world

## Immediate Demo of Working API
```bash
curl https://xfe2ggc5xh.execute-api.us-east-1.amazonaws.com/v1/hello-world
```

Apologies I wasn't able to get DNS + Domain Name Provisioned in time to give it a better name!

# Components Covered

- API Gateway for routing traffic to lambda function
- AWS Lambda Function as deployable artifact (Go executable)
- IAM Role for Github Actions to allow minimum deployment privileges
- IAM Role for Lambda to allow minimum privileges to other resources
- Terraform to manage infrastructure (organized to accomdate multiple environments)
- Github Actions to build and deploy terraform to AWS
- Go to create a very small + fast deployable lambda function artifact to return the payload

# Current Deployment steps
1. create a branch prefixed with feature/
2. Make changes to terraform or Go API func
3. Push changes
4. Enjoy deployment
5. Merge your changes to main when done


# Small Todo + Improvements
- abstract deployment pipeline to allow for deploying to different environments
- Make Github actions pipeline use IAM role to get temp credentials instead of keys from Env var
- Route53 Domain Name + ACM Certificate
- Restrict API traffic with API Key + configure throttling
- Request Latency + Error monitoring
- Implement some centralizd logging


# Setup from Scratch Steps (if building in a new AWS account or environment)

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

## Deploying First Steps on CICD
1. You'll need to first deploy the terraform by deploying the code to github and running the TF pipeline
2. Run the code pipeline after it assumes the lambda func is there already


