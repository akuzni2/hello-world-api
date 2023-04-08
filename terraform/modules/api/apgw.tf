resource "aws_apigatewayv2_api" "hello_world_api_v2" {
  name          = "ct-ak-api-hello-world-v2"
  protocol_type = "HTTP"
}

resource "aws_apigatewayv2_integration" "example_V2" {
  api_id           = aws_apigatewayv2_api.hello_world_api_v2.id
  integration_type = "AWS_PROXY"

  integration_uri = module.api_lambda.lambda_function_arn
}

resource "aws_apigatewayv2_route" "example_v2" {
  api_id    = aws_apigatewayv2_api.hello_world_api_v2.id
  route_key = "GET /v2/hello-world"
  target    = "integrations/${aws_apigatewayv2_integration.example_V2.id}"
}
resource "aws_lambda_permission" "apigw_v2" {
  statement_id  = "AllowAPIGatewayInvokeV2"
  action        = "lambda:InvokeFunction"
  function_name = module.api_lambda.lambda_function_arn
  principal     = "apigateway.amazonaws.com"

  source_arn = "${aws_apigatewayv2_api.hello_world_api_v2.execution_arn}/*/*"
}

resource "aws_apigatewayv2_stage" "hello_world_api_v2" {
  api_id      = aws_apigatewayv2_api.hello_world_api_v2.id
  name        = "dev"
  auto_deploy = true
}

