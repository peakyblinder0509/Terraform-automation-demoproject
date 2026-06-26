    resource "aws_s3_bucket" "main" {
  bucket = "ikramapzz-assesment-s3"
  
  tags = {
    Name = "ikramapzz-s3-bucket"
  }
}
resource "aws_s3_bucket_public_access_block" "main" {
  bucket = aws_s3_bucket.main.id
  
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}
resource "aws_s3_bucket_website_configuration" "assesment" {
  bucket = aws_s3_bucket.main.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "index.html"
  }
}
