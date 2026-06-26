output "s3_bucket_name" {
  description = "Name of the S3 bucket hosting the frontend"
  value       = aws_s3_bucket.main.id
}

output "s3_website_endpoint" {
  description = "S3 static website endpoint"
  value       = aws_s3_bucket_website_configuration.assesment.website_endpoint
}

output "cloudfront_distribution_id" {
  description = "CloudFront distribution ID (used for cache invalidation in pipeline)"
  value       = aws_cloudfront_distribution.assesment.id
}

output "cloudfront_domain_name" {
  description = "CloudFront distribution domain name"
  value       = aws_cloudfront_distribution.assesment.domain_name
}

output "master_public_ip" {
  description = "Public IP of master EC2 instance"
  value       = aws_instance.master.public_ip
}
