<p align="center">
  <a href="https://github.com/terraform-trailwatch-modules" title="Terraform Trailwatch Modules"><img src="https://raw.githubusercontent.com/terraform-trailwatch-modules/art/refs/heads/main/logo.jpg" height="100" alt="Terraform Trailwatch Modules"></a>
</p>

<h1 align="center">AWS Chatbot</h1>

<p align="center">
  <a href="https://github.com/terraform-trailwatch-modules/terraform-aws-chatbot/releases" title="Releases"><img src="https://img.shields.io/badge/Release-1.0.0-1d1d1d?style=for-the-badge" alt="Releases"></a>
  <a href="https://github.com/terraform-trailwatch-modules/terraform-aws-chatbot/blob/main/LICENSE" title="License"><img src="https://img.shields.io/badge/License-MIT-1d1d1d?style=for-the-badge" alt="License"></a>
</p>

## About
This Terraform module automates the deployment of an AWS Chatbot integration with EventBridge. The integration leverages Lambda functions and SNS topics to seamlessly route events from EventBridge to your AWS Chatbot, enabling real-time notifications and streamlined incident response.

## Features
- Event-driven integration with EventBridge
- Lambda function processing for event transformation and filtering
- Reliable event delivery with SNS topics
- Seamless integration with AWS Chatbot


<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.9 |
| <a name="requirement_archive"></a> [archive](#requirement\_archive) | ~> 2.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |
| <a name="requirement_null"></a> [null](#requirement\_null) | ~> 3.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_tags"></a> [aws\_tags](#input\_aws\_tags) | Additional tags to apply to this module. | `map(string)` | `{}` | no |
| <a name="input_chatbot_slack_channels"></a> [chatbot\_slack\_channels](#input\_chatbot\_slack\_channels) | A list of Slack Channel IDs to send notifications to. | `list(string)` | n/a | yes |
| <a name="input_chatbot_slack_team"></a> [chatbot\_slack\_team](#input\_chatbot\_slack\_team) | The Slack Workspace ID associated with the ChatBot. | `string` | n/a | yes |
| <a name="input_eventbridge_patterns"></a> [eventbridge\_patterns](#input\_eventbridge\_patterns) | Events to send notifications for. | `map(string)` | `{}` | no |
| <a name="input_id"></a> [id](#input\_id) | Unique ID associated with this deployment | `string` | n/a | yes |
<!-- END_TF_DOCS -->

## Simple Example
```hcl
module "terraform_trailwatch_chatbot" {
  source                  = "terraform-trailwatch-modules/chatbot/aws"
  id                      = "my-chatbot"
  chatbot_slack_channels  = ["C01234567", "C12345678"]
  chatbot_slack_team      = "T01234567"
}
```

## Advanced Example
```hcl
module "terraform_trailwatch_chatbot" {
  source                  = "terraform-trailwatch-modules/chatbot/aws"
  id                      = "my-chatbot"
  chatbot_slack_channels  = ["C01234567", "C12345678"]
  chatbot_slack_team      = "T01234567"
    eventbridge_patterns = {
    ec2_instance_state_change = <<EOF
    {
      "source": [
        "aws.ec2"
      ],
      "detail-type": [
        "EC2 Instance State-change Notification"
      ]
    }
    EOF
    }
}
```

## Changelog
For a detailed list of changes, please refer to the [CHANGELOG.md](CHANGELOG.md).

## License
This module is licensed under the [MIT License](LICENSE).
