local {
    cluster_name = format("%s-argocd", local.general_prefix)
}

// count = var.create_eks ? 1 : 0