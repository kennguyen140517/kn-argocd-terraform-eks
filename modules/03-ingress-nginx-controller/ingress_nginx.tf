resource "helm_release" "ingress_nginx" {
  name = format("%s-ingress-nginx", local.general_prefix)

  repository       = "https://kubernetes.github.io/ingress-nginx"
  chart            = "ingress-nginx"
  version          = "4.4.0"
  namespace        = "ingress-nginx"
  create_namespace = true
  cleanup_on_fail  = true

  set {
    name  = "controller.service.annotations.service\\.beta\\.kubernetes\\.io/aws-load-balancer-type"
    value = "nlb"
  }

  set {
    name  = "controller.service.annotations.service\\.beta\\.kubernetes\\.io/aws-load-balancer-scheme"
    value = "internet-facing"
  }
}

# service.beta.kubernetes.io/aws-load-balancer-internal: "true"
# service.beta.kubernetes.io/aws-load-balancer-scheme: internal
# service.beta.kubernetes.io/aws-load-balancer-type: nlb