resource "aws_s3_bucket" "b" {
  bucket = "infra-test4"

  tags = {
    Name        = "salary-data"
    Environment = "prod"
  }
}
