output "ct_bucket_name" { value = aws_s3_bucket.ct_logs.bucket }
output "ct_bucket_arn"  { value = aws_s3_bucket.ct_logs.arn }

output "vpc_bucket_name" { value = aws_s3_bucket.vpc_logs.bucket }
output "vpc_bucket_arn"  { value = aws_s3_bucket.vpc_logs.arn }

output "ir_bucket_name" { value = aws_s3_bucket.ir_forensics.bucket }
output "ir_bucket_arn"  { value = aws_s3_bucket.ir_forensics.arn }