resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = merge(var.tags, { Name = "${var.prefix}-vpc" })
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags   = merge(var.tags, { Name = "${var.prefix}-igw" })
}

resource "aws_subnet" "public_a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "${var.region}a"
  map_public_ip_on_launch = true
  tags                    = merge(var.tags, { Name = "${var.prefix}-public-a" })
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  tags   = merge(var.tags, { Name = "${var.prefix}-rt-public" })
}

resource "aws_route" "public_inet" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "public_a" {
  subnet_id      = aws_subnet.public_a.id
  route_table_id = aws_route_table.public.id
}

# Flow Logs role + binding to S3
data "aws_iam_policy_document" "flowlogs_assume" {
  statement {
    actions = ["sts:AssumeRole"]
    principals { 
        type = "Service"
        identifiers = ["vpc-flow-logs.amazonaws.com"] 
    }
  }
}

resource "aws_iam_role" "flowlogs" {
  name               = "${var.prefix}-flowlogs-role"
  assume_role_policy = data.aws_iam_policy_document.flowlogs_assume.json
  tags               = var.tags
}

resource "aws_iam_role_policy" "flowlogs" {
  role = aws_iam_role.flowlogs.id
  policy = jsonencode({
    Version   = "2012-10-17",
    Statement = [{
      Effect   = "Allow",
      Action   = ["s3:PutObject"],
      Resource = "${var.vpc_logs_bucket_arn}/*"
    }]
  })
}

resource "aws_flow_log" "to_s3" {
  vpc_id          = aws_vpc.main.id
  traffic_type    = "ALL"
  log_destination = var.vpc_logs_bucket_arn
  iam_role_arn    = aws_iam_role.flowlogs.arn
  tags            = var.tags
}