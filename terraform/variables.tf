variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "ap-south-1"
}

variable "lambda_function_name" {
  default = "ebs-cost-optimizer"
}

variable "sns_topic_name" {
  default = "cost-optimizer-alerts"
}

variable "eventbridge_schedule_name" {
  default = "daily-ebs-cost-optimizer"
}