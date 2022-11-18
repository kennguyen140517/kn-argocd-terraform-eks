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

# Get EKS authentication for being able to manage k8s objects from terraform
provider "kubernetes" {
  host                   = module.cluster.cluster_endpoint
  cluster_ca_certificate = base64decode(module.cluster.certificate_authority_data)
  token                  = data.aws_eks_cluster_auth.cluster.token
}

# provider "helm" {
#   kubernetes {
#     host                   = module.cluster.cluster_endpoint
#     cluster_ca_certificate = base64decode(module.cluster.certificate_authority_data)
#     token                  = data.aws_eks_cluster_auth.cluster.token
#   }
# }