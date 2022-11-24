resource "helm_release" "ingress_nginx" {
  name = format("%s-ingress-nginx", local.general_prefix)

  repository       = "https://kubernetes.github.io/ingress-nginx"
  chart            = "ingress-nginx"
  version          = "4.4.0"
  namespace        = "ingress-nginx"
  create_namespace = true
  cleanup_on_fail  = true
}