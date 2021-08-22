output "s3_key_arn" {
  value = aws_kms_key.mykey.*
}

output "s3_bucket" {
  value = aws_s3_bucket.remotestate.bucket_domain_name
}