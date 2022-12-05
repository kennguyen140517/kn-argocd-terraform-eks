resource "helm_release" "sealed_secrets" {
  name = format("%s", local.general_prefix)

  repository       = "https://bitnami-labs.github.io/sealed-secrets"
  chart            = "sealed-secrets"
  version          = "2.7.1"
  namespace        = "sealed-secrets"
  create_namespace = true
  cleanup_on_fail  = true
}