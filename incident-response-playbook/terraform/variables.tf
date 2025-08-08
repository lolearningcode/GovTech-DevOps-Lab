variable "prefix" {
  type        = string
  description = "Name prefix for all resources"
  default     = "hardened-ir"
}

variable "region" {
  type        = string
  description = "AWS region to deploy into"
  default     = "us-east-1"
}

variable "tags" {
  type        = map(string)
  description = "Common tags"
  default = {
    Project     = "govtech-lab"
    Component   = "incident-response-playbook"
    Compliance  = "NIST-800-53"
    Environment = "lab"
    Owner       = "cleo"
  }
}

variable "enable_kms" {
  type        = bool
  description = "Use SSE-KMS for S3 and CloudTrail (vs SSE-S3)"
  default     = false
}

variable "allowed_alert_emails" {
  type        = list(string)
  description = "Email addresses to subscribe to SNS alerts"
  default     = []
}