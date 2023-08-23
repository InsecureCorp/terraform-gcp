resource "aws_s3_bucket" "b" {
  bucket = "infra-test2"

  tags = {
    Name        = "salary-data"
    Environment = "prod"
  }
}
