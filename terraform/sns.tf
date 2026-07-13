resource "aws_sns_topic" "cost_alerts" {

  name = var.sns_topic_name
}