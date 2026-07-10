resource "aws_s3_bucket" "healthcare_bucket" {

  bucket = "${var.project_name}-${var.environment}-${random_string.bucket_suffix.result}"

  tags = merge(
    var.common_tags,
    {
      Name = "${var.project_name}-${var.environment}-bucket"
    }
  )

}
resource "random_string" "bucket_suffix" {

  length  = 6
  upper   = false
  special = false

}
resource "aws_s3_bucket_versioning" "versioning" {

  bucket = aws_s3_bucket.healthcare_bucket.id

  versioning_configuration {

    status = "Enabled"

  }

}
resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {

  bucket = aws_s3_bucket.healthcare_bucket.id

  rule {

    apply_server_side_encryption_by_default {

      sse_algorithm = "AES256"

    }

  }

}
resource "aws_s3_bucket_public_access_block" "public_access" {

  bucket = aws_s3_bucket.healthcare_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

}
resource "aws_s3_bucket_ownership_controls" "ownership" {

  bucket = aws_s3_bucket.healthcare_bucket.id

  rule {

    object_ownership = "BucketOwnerPreferred"

  }

}
resource "aws_s3_bucket_lifecycle_configuration" "this" {
  bucket = aws_s3_bucket.healthcare_bucket.id

  rule {
    id     = "log-lifecycle"
    status = "Enabled"

    filter {
      prefix = "logs/"
    }

    expiration {
      days = var.log_retention_days
    }
  }
}