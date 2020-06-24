resource "aws_s3_bucket" "module_bucket" {
    bucket = "supercool-hashibucket-${var.identifier}"
    acl = "public-read"
    force_destroy = true
    tags = var.tags
}

resource "aws_s3_bucket_policy" "module_bucket_policy" {
    bucket = aws_s3_bucket.module_bucket.id

    policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "ImageBucketPolicy",
  "Statement": [
    {
      "Sid": "PublicReadForGetBucketObjects",
      "Effect": "Allow",
      "Principal": "*",
      "Action": ["s3:GetObject"],
      "Resource": "arn:aws:s3:::${aws_s3_bucket.module_bucket.id}/*"
    }
  ]
}
POLICY
}
