resource "helm_release" "cert_manager" {
  name = format("%s-cert-manager", local.general_prefix)

  repository       = "https://charts.jetstack.io"
  chart            = "cert-manager"
  version          = "4.4.0"
  namespace        = "cert-manager"
  create_namespace = true
  cleanup_on_fail  = true
}