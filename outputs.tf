output "aws_lab_tfstate_bucket_arn" {
    value = data.aws_s3_bucket.aws_lab_tfstate.id
}

output "dynamodb_table_name" {
    value = data.aws_dynamodb_table.terraform_locks.id
}