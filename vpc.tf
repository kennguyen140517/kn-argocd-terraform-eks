# Create a VPC
resource "aws_vpc" "kn_lab_vpc" {
  cidr_block = "10.56.0.0/16"
}
