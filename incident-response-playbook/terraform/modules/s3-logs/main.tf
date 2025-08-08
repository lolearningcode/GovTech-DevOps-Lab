resource "aws_s3_bucket" "ct_logs" {
  bucket        = "${var.prefix}-ct-logs-${var.account_id}"
  force_destroy = true
  tags          = var.tags
}
resource "aws_s3_bucket" "vpc_logs" {
  bucket        = "${var.prefix}-vpc-logs-${var.account_id}"
  force_destroy = true
  tags          = var.tags
}
resource "aws_s3_bucket" "ir_forensics" {
  bucket        = "${var.prefix}-ir-forensics-${var.account_id}"
  force_destroy = true
  tags          = var.tags
}

# Hardening: block public, version, encrypt (for each)
locals {
  buckets = {
    ct  = aws_s3_bucket.ct_logs.id
    vpc = aws_s3_bucket.vpc_logs.id
    ir  = aws_s3_bucket.ir_forensics.id
  }
}

resource "aws_s3_bucket_public_access_block" "pab" {
  for_each = local.buckets
  bucket                  = each.value
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "ver" {
  for_each = local.buckets
  bucket   = each.value
  versioning_configuration { status = "Enabled" }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "enc" {
  for_each = local.buckets
  bucket   = each.value
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = var.enable_kms ? "aws:kms" : "AES256"
    }
    bucket_key_enabled = var.enable_kms
  }
}