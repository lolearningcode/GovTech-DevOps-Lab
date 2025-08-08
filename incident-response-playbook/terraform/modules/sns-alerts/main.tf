resource "aws_sns_topic" "alerts" {
  name = "${var.prefix}-alerts"
  tags = var.tags
}

resource "aws_sns_topic_subscription" "emails" {
  for_each  = toset(var.allowed_alert_emails)
  topic_arn = aws_sns_topic.alerts.arn
  protocol  = "email"
  endpoint  = each.value
}

output "topic_arn" { value = aws_sns_topic.alerts.arn }