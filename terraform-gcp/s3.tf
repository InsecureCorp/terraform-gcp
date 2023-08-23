resource "aws_s3_bucket" "b" {
  bucket = "infra-demo"

  tags = {
    Name        = "salary-data"
    Environment = "prod"
  }
}
