resource "helm_release" "kube_prometheus_stack" {
  name = format("%s-kube-prometheus-stack", local.general_prefix)

  repository       = "https://prometheus-community.github.io/helm-charts"
  chart            = "kube-prometheus-stack"
  version          = "42.1.1"
  namespace        = "kube-prometheus-stack"
  create_namespace = true
  cleanup_on_fail  = true

  values = [
    file("kube_prometheus_stack/values.yaml")
  ]
}