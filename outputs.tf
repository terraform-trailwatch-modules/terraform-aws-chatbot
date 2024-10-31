output "chatbot_event_lambda" {
  description = "The AWS Chatbot EventBridge Lambda function."
  value       = aws_lambda_function.event_lambda
}

output "chatbot_topic" {
  description = "The AWS Chatbot SNS topic."
  value       = aws_sns_topic.chatbot_topic
}

output "chatbot_role" {
  description = "The IAM role that AWS Chatbot assumes in Slack."
  value       = aws_iam_role.chatbot_role
}