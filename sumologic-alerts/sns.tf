resource "aws_sns_topic" "alert_topic" {
  name = var.sns_topic_name
}
