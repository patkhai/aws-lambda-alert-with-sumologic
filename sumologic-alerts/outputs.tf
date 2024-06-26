output "instance_id" {
  value = aws_instance.web.id
}

output "sns_topic_arn" {
  value = aws_sns_topic.alert_topic.arn
}

output "lambda_function_arn" {
  value = aws_lambda_function.restart_instance.arn
}
