resource "aws_lambda_function" "restart_instance" {
  function_name = var.lambda_function_name
  role          = aws_iam_role.lambda_role.arn
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.8"

  filename         = "lambda_function.py"

  environment {
    variables = {
      INSTANCE_ID    = aws_instance.web.id
      SNS_TOPIC_ARN  = aws_sns_topic.alert_topic.arn
    }
  }
}

resource "aws_lambda_permission" "allow_sns" {
  statement_id  = "AllowExecutionFromSNS"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.restart_instance.function_name
  principal     = "sns.amazonaws.com"
  source_arn    = aws_sns_topic.alert_topic.arn
}
