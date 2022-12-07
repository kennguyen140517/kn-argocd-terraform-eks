resource "helm_release" "sealed_secrets" {
  name = format("%s", local.general_prefix)

  repository       = "https://bitnami-labs.github.io/sealed-secrets"
  chart            = "sealed-secrets"
  version          = "2.7.1"
  namespace        = "kube-system"
  create_namespace = false
  cleanup_on_fail  = true
}