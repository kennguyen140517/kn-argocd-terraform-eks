# Install cert-manager crds before installing cert-manager by helm using the following command
# kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.10.1/cert-manager.crds.yaml -n cert-manager                 

resource "helm_release" "cert_manager" {
  name = format("%s-cert-manager", local.general_prefix)

  repository       = "https://charts.jetstack.io"
  chart            = "cert-manager"
  version          = "1.10.1"
  namespace        = "cert-manager"
  create_namespace = true
  cleanup_on_fail  = true
}
