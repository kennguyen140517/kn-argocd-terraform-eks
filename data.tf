# get all available AZs in our region
data "aws_availability_zones" "available" {
  state = "available"   
}

data "aws_region" "current" {}
data "aws_caller_identity" "current" {}