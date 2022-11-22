resource "helm_release" "argocd" {
  name = format("%s-argocd", local.general_prefix)

  repository        = "https://argoproj.github.io/argo-helm"
  chart             = "argo-cd"
  version           = "5.14.1"
  create_namespace  = true

  values = [
    file("argocd/application.yml")
  ]
}