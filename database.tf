resource "aws_dynamodb_table" "dynamo-developer" {
  provider     = aws.us-east-2
  name         = "CourseAlura"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "UserId"
  range_key    = "UserName"

  attribute {
    name = "UserId"
    type = "S"
  }

  attribute {
    name = "UserName"
    type = "S"
  }
}
