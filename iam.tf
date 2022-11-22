# Create IAM role for AWS Load Balancer Controller, and attach to EKS OIDC

module "iam_eks-alb-controller-iam-role-for-service-accounts-eks" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  version = "~> 5.5.0"

  role_name = format("%s-eks-alb-controller-role", local.general_prefix)
  attach_load_balancer_controller_policy = true

  oidc_providers = {
    ex = {
      provider_arn               = module.cluster.oidc_provider_arn
      namespace_service_accounts = ["kube-system:aws-load-balancer-controller"]
    }
  }

  depends_on = [
    module.cluster
  ]
}

# Create IAM role for External DNS, and attach to EKS OIDC
module "iam_eks-external-dns-iam-role-for-service-accounts-eks" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  version = "~> 5.5.0"

  role_name = format("%s-eks-external-dns-role", local.general_prefix)
  attach_external_dns_policy    = true
  external_dns_hosted_zone_arns = ["arn:aws:route53:::hostedzone/*"]

  oidc_providers = {
    ex = {
      provider_arn               = module.cluster.oidc_provider_arn
      namespace_service_accounts = ["kube-system:external-dns"]
    }
  }

  depends_on = [
    module.cluster
  ]
}