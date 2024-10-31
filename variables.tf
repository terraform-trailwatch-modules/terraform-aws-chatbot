variable "id" {
  description = "Unique ID associated with this deployment"
  type        = string
}

variable "chatbot_slack_channels" {
  description = "A list of Slack Channel IDs to send notifications to."
  type        = list(string)
}

variable "chatbot_slack_team" {
  description = "The Slack Workspace ID associated with the ChatBot."
  type        = string
}

variable "aws_tags" {
  description = "Additional tags to apply to this module."
  type        = map(string)
  default     = {}
}

variable "eventbridge_patterns" {
  description = "Events to send notifications for."
  type        = map(string)
  default     = {}
}
