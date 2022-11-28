# locals {
#   ingress_controller_iam_role = format("%s-eks-alb-controller-role", local.general_prefix)
# }

# resource "kubernetes_service_account" "aws_load_balancer_controller" {
#   metadata {
#     name      = var.ingress_controller_name
#     namespace = "kube-system"

#     labels = {
#       "app.kubernetes.io/component" = "controller"
#       "app.kubernetes.io/name"      = var.ingress_controller_name
#     }

#     annotations = {
#       "eks.amazonaws.com/role-arn" = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/${local.ingress_controller_iam_role}"
#     }
#   }
# }

# resource "helm_release" "aws_load_balancer_controller" {
#   name = format("%s-aws-load-balancer-controller", local.general_prefix)

#   repository      = "https://aws.github.io/eks-charts"
#   chart           = "aws-load-balancer-controller"
#   version         = "1.4.6"
#   namespace       = "kube-system"
#   cleanup_on_fail = true

#   set {
#     name  = "clusterName"
#     value = var.cluster_name
#   }

#   set {
#     name  = "serviceAccount.name"
#     value = kubernetes_service_account.aws_load_balancer_controller.metadata.0.name
#   }

#   set {
#     name  = "serviceAccount.create"
#     value = "false"
#   }
# }