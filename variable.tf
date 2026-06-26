variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "AWS CLI profile to use"
  type        = string
  default     = "assesment"
}

variable "s3_bucket_name" {
  description = "Name of the S3 bucket for frontend hosting"
  type        = string
  default     = "ikramapzz-assesment-s3"
}

variable "instance_type" {
  description = "EC2 instance type for master/worker nodes"
  type        = string
  default     = "c7i-flex.large"
}

variable "ami_id" {
  description = "AMI ID for EC2 instances"
  type        = string
  default     = "ami-0f8a61b66d1accaee"
}
variable "ssh_public_key" {
  description = "SSH public key for EC2 access"
  type        = string
}
