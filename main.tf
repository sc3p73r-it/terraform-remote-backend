resource "aws_s3_bucket" "aws_lab_tfstate" {
    bucket = var.s3_bucket_name
}

resource "aws_s3_bucket_ownership_controls" "s3_ownership_tfstate" {
  bucket = aws_s3_bucket.aws_lab_tfstate.id
    rule {
        object_ownership = "BucketOwnerPreferred"
    } 
}

resource "aws_s3_bucket_acl" "s3_bucket_acl_tfstate" {
   depends_on = [ aws_s3_bucket_ownership_controls.s3_ownership_tfstate ]
    bucket = aws_s3_bucket.aws_lab_tfstate.id
    acl = "private"
}

resource "aws_s3_bucket_versioning" "s3_versioning_tfstate" {
    bucket = aws_s3_bucket.aws_lab_tfstate.id
    versioning_configuration {
        status = "Enabled"
    }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "s3_encryption_tfstate" {
    bucket = aws_s3_bucket.aws_lab_tfstate.id

    rule {
        apply_server_side_encryption_by_default {
            sse_algorithm = "AES256"
        }
    }
}

resource "aws_dynamodb_table" "terraform_locks"{
    name = var.dynamodb_table_name
    billing_mode = var.billing_dynamodb_mode
    hash_key = var.hash_key_dynamodb
    attribute {
        name = "LockID"
        type = "S"
    }
}