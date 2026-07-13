output "lambda_name" {

  value = aws_lambda_function.cost_optimizer.function_name
}

output "sns_topic_arn" {

  value = aws_sns_topic.cost_alerts.arn
}

output "eventbridge_rule" {

  value = aws_cloudwatch_event_rule.daily_schedule.name
}