# get all available AZs in our region
data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_region" "current" {}
data "aws_caller_identity" "current" {}

# # Get EKS cluster info to configure Kubernetes and Helm providers
# data "aws_eks_cluster" "cluster" {
#   name = local.cluster_name
# }
# data "aws_eks_cluster_auth" "cluster" {
#   name = local.cluster_name
# }