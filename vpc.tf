# Create a VPC
resource "aws_vpc" "kn_argocd_lab_vpc" {
  name = "kn-argocd-lab-vpc"
  cidr_block = "10.33.0.0/16"
}
