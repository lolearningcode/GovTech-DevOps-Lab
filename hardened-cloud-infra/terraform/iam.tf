resource "aws_iam_role" "ec2_role" {
  name = "${var.project}-ec2-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = {
        Service = "ec2.amazonaws.com"
      },
      Action = "sts:AssumeRole"
    }]
  })

  tags = {
    Name = "${var.project}-ec2-role"
  }
}

resource "aws_iam_role_policy_attachment" "ec2_ssm" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_role_policy" "ec2_kms_policy" {
  name = "${var.project}-ec2-kms-decrypt"
  role = aws_iam_role.ec2_role.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement : [
      {
        Effect : "Allow",
        Action : [
          "kms:Decrypt",
          "kms:GenerateDataKey*"
        ],
        Resource : aws_kms_key.cloudtrail.arn
      },
      {
        Effect : "Allow",
        Action : [
          "s3:GetObject"
        ],
        Resource : "arn:aws:s3:::${var.project}-cloudtrail-logs/*"
      }
    ]
  })
}