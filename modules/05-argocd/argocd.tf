# kubectl delete ValidatingWebhookConfiguration kn-lab-argocd-ingress-nginx-admission -n ingress-nginx

resource "helm_release" "argocd" {
  name = format("%s", local.general_prefix)

  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  version          = "5.14.1"
  namespace        = "argocd"
  create_namespace = true
  cleanup_on_fail  = true

  values = [
    file("argocd/values.yaml")
  ]
}