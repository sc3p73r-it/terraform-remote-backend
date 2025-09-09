output "aws_lab_tfstate_bucket_arn" {
    value = resource.aws_s3_bucket.aws_lab_tfstate.id
}

output "dynamodb_table_name" {
    value = resource.aws_dynamodb_table.terraform_locks.id
}