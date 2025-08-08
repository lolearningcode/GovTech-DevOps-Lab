resource "aws_guardduty_detector" "this" {
  enable = true
  datasources {
    malware_protection {
      scan_ec2_instance_with_findings {
        ebs_volumes {
          enable = true
        }
      }
    }
  }
  tags = var.tags
}