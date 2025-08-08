output "cloudtrail_bucket"    { value = module.s3_logs.ct_bucket_name }
output "vpc_flow_bucket"      { value = module.s3_logs.vpc_bucket_name }
output "forensics_bucket"     { value = module.s3_logs.ir_bucket_name }
output "sns_alerts_topic_arn" { value = module.sns_alerts.topic_arn }
output "vpc_id"               { value = module.network.vpc_id }
output "public_subnet_id"     { value = module.network.public_subnet_id }