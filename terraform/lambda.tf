resource "aws_lambda_function" "cost_optimizer" {

  function_name = var.lambda_function_name

  role = aws_iam_role.lambda_role.arn

  handler = "cost_optimizer.lambda_handler"

  runtime = "python3.13"

  filename = "../lambda/lambda.zip"

  source_code_hash = filebase64sha256("../lambda/lambda.zip")

  timeout = 30

  environment {

    variables = {

      DELETE_ENABLED = "false"

      TOPIC_ARN = aws_sns_topic.cost_alerts.arn
    }
  }
}