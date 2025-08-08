data "aws_iam_policy_document" "ct_bucket_policy" {
  statement {
    sid     = "AWSCloudTrailAclCheck"
    effect  = "Allow"
    actions = ["s3:GetBucketAcl"]
    principals {
      type        = "Service"
      identifiers = ["cloudtrail.amazonaws.com"]
    }
    resources = [var.ct_bucket_arn]
  }
  statement {
    sid     = "AWSCloudTrailWrite"
    effect  = "Allow"
    actions = ["s3:PutObject"]
    principals { 
        type = "Service"
        identifiers = ["cloudtrail.amazonaws.com"] 
    }
    resources = ["${var.ct_bucket_arn}/AWSLogs/${var.account_id}/*"]
    condition {
      test     = "StringEquals"
      variable = "s3:x-amz-acl"
      values   = ["bucket-owner-full-control"]
    }
  }
}

resource "aws_s3_bucket_policy" "ct_logs" {
  bucket = var.ct_bucket_name
  policy = data.aws_iam_policy_document.ct_bucket_policy.json
}

resource "aws_cloudtrail" "main" {
  name                          = "${var.prefix}-trail"
  s3_bucket_name                = var.ct_bucket_name
  include_global_service_events = true
  is_multi_region_trail         = true
  enable_log_file_validation    = true

  event_selector {
    read_write_type           = "All"
    include_management_events = true
  }

  tags = var.tags
}