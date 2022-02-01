# AWS S3 bucket for static hosting

resource "aws_s3_bucket" "example-static-site" {
  bucket = "example-static-site"

  tags = {
    Name        = "example-static-site"
    environment = "dev"
  }

  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}

resource "aws_s3_bucket_policy" "example-static-site" {
  bucket = aws_s3_bucket.example-static-site.id

  policy = <<POLICY
{
  "Version": "2008-10-17",
  "Statement": [
    {
      "Sid": "PublicReadForGetBucketObjects",
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::goit-static-site/*"
    }
  ]
}
POLICY
}