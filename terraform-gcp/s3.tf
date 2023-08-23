resource "aws_s3_bucket" "b" {
  bucket = "infra-test5"

  tags = {
    Name        = "salary-data"
    Environment = "prod"
  }
}
