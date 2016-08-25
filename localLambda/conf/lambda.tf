resource "aws_lambda_function" "sethu-blogreader" {
    filename = "../build/packaged.zip"
    function_name = "sethu-blogreader"
    role = "${aws_iam_role.iam_for_lambda.arn}"
    handler = "handler.default"
    source_code_hash = "${base64sha256(file("../build/packaged.zip"))}"
    runtime = "nodejs4.3"
		depends_on = ["aws_iam_role.iam_for_lambda", "aws_iam_role_policy.write_to_cloudwatch_policy"]
}

resource "aws_lambda_permission" "allow_api_gateway" {
  statement_id = "AllowExecutionFromAPIGateway"
  action = "lambda:InvokeFunction"
  function_name = "${aws_lambda_function.sethu-blogreader.arn}"
  principal = "apigateway.amazonaws.com"
  source_arn = "arn:aws:execute-api:ap-southeast-2:779624523000:${aws_api_gateway_rest_api.sethu-blogreader.id}/*/GET/blog/*"
  depends_on = ["aws_api_gateway_rest_api.sethu-blogreader"]
}
