resource "aws_cloudwatch_event_rule" "daily_schedule" {

  name = var.eventbridge_schedule_name

  schedule_expression = "rate(1 day)"
}
resource "aws_cloudwatch_event_target" "lambda_target" {

  rule = aws_cloudwatch_event_rule.daily_schedule.name

  arn = aws_lambda_function.cost_optimizer.arn
}
resource "aws_lambda_permission" "allow_eventbridge" {

  statement_id = "AllowExecutionFromEventBridge"

  action = "lambda:InvokeFunction"

  function_name = aws_lambda_function.cost_optimizer.function_name

  principal = "events.amazonaws.com"

  source_arn = aws_cloudwatch_event_rule.daily_schedule.arn
}
