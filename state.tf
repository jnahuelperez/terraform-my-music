# BUCKET
resource "aws_s3_bucket" "remotestate" {
  bucket = var.s3_bkt_name
  acl    = "private"
  tags = {
      Name = var.s3_bkt_name
  }

  server_side_encryption_configuration {
      rule {
          apply_server_side_encryption_by_default {
              kms_master_key_id = aws_kms_key.mykey.arn
              sse_algorithm     = "aws:kms"
          }
      }
  }
}

# IAM POLICY

data "aws_iam_policy_document" "s3-full-access" {
  statement {
    effect = "Allow"

    actions = [
      "s3:ListBucket",
      "s3:GetBucketLocation",
      "s3:ListBucketMultipartUploads"
    ]

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    resources = ["${aws_s3_bucket.remotestate.arn}"]
  }

  statement {
    effect = "Allow"
    actions = [
      "s3:PutObject",
      "s3:GetObject",
      "s3:DeleteObject",
      "s3:ListMultipartUploadParts",
      "s3:AbortMultipartUpload"
    ]

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    resources = ["${aws_s3_bucket.remotestate.arn}/*"]
  }
}
resource "aws_s3_bucket_policy" "s3-full-access" {
  bucket = "${aws_s3_bucket.remotestate.id}"
  policy = "${data.aws_iam_policy_document.s3-full-access.json}"
}
data "aws_iam_policy_document" "bucket-full-access" {
  statement {
    effect = "Allow"
    actions = [
      "s3:ListBucket",
      "s3:GetBucketLocation",
      "s3:ListBucketMultipartUploads"
    ]
    resources = ["${aws_s3_bucket.remotestate.arn}"]
  }
  statement {
    effect = "Allow"
    actions = [
      "s3:PutObject",
      "s3:GetObject",
      "s3:DeleteObject",
      "s3:ListMultipartUploadParts",
      "s3:AbortMultipartUpload"
    ]
    resources = ["${aws_s3_bucket.remotestate.arn}/*"]
  }
}
resource "aws_iam_policy" "bucket-full-access" {
  name = "s3-${var.s3_bkt_name}-full-access"
  policy = "${data.aws_iam_policy_document.bucket-full-access.json}"
}


# ENCRIPTION
resource "aws_kms_key" "mykey" {
  description             = "Key to encrypt buckets"
  deletion_window_in_days = 10
}