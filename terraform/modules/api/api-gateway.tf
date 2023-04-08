#resource "aws_apigatewayv2_api" "hello_world_api" {
#  name          = "ct-ak-api-hello-world"
#  protocol_type = "HTTP"
#}
#
#resource "aws_apigatewayv2_integration" "example" {
#  api_id           = aws_apigatewayv2_api.hello_world_api.id
#  integration_type = "AWS_PROXY"
#
#  integration_uri = module.api_lambda.lambda_function_arn
#}
#
#resource "aws_apigatewayv2_route" "example" {
#  api_id    = aws_apigatewayv2_api.hello_world_api.id
#  route_key = "GET /v1/hello-world"
#  target    = "integrations/${aws_apigatewayv2_integration.example.id}"
#}
#resource "aws_lambda_permission" "apigw" {
#  statement_id  = "AllowAPIGatewayInvoke"
#  action        = "lambda:InvokeFunction"
#  function_name = module.api_lambda.lambda_function_arn
#  principal     = "apigateway.amazonaws.com"
#
#  source_arn = "${aws_apigatewayv2_api.hello_world_api.execution_arn}/*/*"
#}
#
#resource "aws_apigatewayv2_stage" "hello_world_api" {
#  api_id      = aws_apigatewayv2_api.hello_world_api.id
#  name        = "$default"
#  auto_deploy = true
#}
#
#output "api_gateway_invoke_url" {
#  value = aws_apigatewayv2_api.hello_world_api.api_endpoint
#}
