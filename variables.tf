variable "aws_region" {
  type = string
  default = "ap-southeast-1"
}

variable "s3_bucket_name" {
  type = string
  default = "aws-lab-tfstate-12345"
}

variable "dynamodb_table_name" {
  description = "AWS DynamoDB table name for Terraform state locking"
  type    = string
  default = "aws-lab-tfstate-locks"
}

variable "billing_dynamodb_mode" {
  type = string
  default = "PAY_PER_REQUEST"
}

variable "hash_key_dynamodb" {
  type = string
  default = "LockID"
}