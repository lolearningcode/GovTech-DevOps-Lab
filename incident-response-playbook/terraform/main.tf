locals {
  account_id = data.aws_caller_identity.current.account_id
}

module "s3_logs" {
  source     = "./modules/s3-logs"
  prefix     = var.prefix
  account_id = local.account_id
  enable_kms = var.enable_kms
  tags       = var.tags
}

module "cloudtrail" {
  source             = "./modules/cloudtrail"
  prefix             = var.prefix
  account_id         = local.account_id
  ct_bucket_arn      = module.s3_logs.ct_bucket_arn
  ct_bucket_name     = module.s3_logs.ct_bucket_name
  tags               = var.tags
}

module "sns_alerts" {
  source               = "./modules/sns-alerts"
  prefix               = var.prefix
  allowed_alert_emails = var.allowed_alert_emails
  tags                 = var.tags
}

module "network" {
  source            = "./modules/network"
  prefix            = var.prefix
  region            = var.region
  vpc_logs_bucket_arn = module.s3_logs.vpc_bucket_arn
  tags              = var.tags
}

module "guardduty" {
  source = "./modules/guardduty"
  tags = var.tags
}