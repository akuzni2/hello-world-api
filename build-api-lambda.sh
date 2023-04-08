#!/usr/bin/env bash

GOOS=linux go build -o reminder-function api/main.go
zip api-lambda-function.zip api-lambda-function

aws lambda update-function-code \
    --function-name ct_ak_hello_world_api \
    --zip-file fileb://api-lambda-function.zip