# Configure the AWS Provider
provider "aws" {
  region = var.region
  allowed_account_ids = var.allowed_account_ids

  default_tags {
    tags = var.tags
  }
}

provider "aws" {
  alias = "withoutProviderTags"
  region = var.region
}

# # Get EKS cluster info to configure Kubernetes and Helm providers
# data "aws_eks_cluster" "cluster" {
#   name = local.cluster_name
# }
# data "aws_eks_cluster_auth" "cluster" {
#   name = local.cluster_name
# }

# # Get EKS authentication for being able to manage k8s objects from terraform
# provider "kubernetes" {
#   host                   = data.aws_eks_cluster.cluster.endpoint
#   cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
#   token                  = data.aws_eks_cluster_auth.cluster.token
# }

# provider "helm" {
#   kubernetes {
#     host                   = data.aws_eks_cluster.cluster.endpoint
#     cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
#     token                  = data.aws_eks_cluster_auth.cluster.token
#   }
# }