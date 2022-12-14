# module "main_vpc" {
#   source = "./modules/00-vpc"

#   region                  = var.region
#   master_prefix           = var.master_prefix
#   env_prefix              = var.env_prefix
#   app_prefix              = var.app_prefix
#   allowed_account_ids     = var.allowed_account_ids
#   vpc_cidr                = var.vpc_cidr
#   subnet_prefix_extension = var.subnet_prefix_extension
#   zone_offset             = var.zone_offset

#   tags = var.tags
# }

# module "main_eks" {
#   source = "./modules/01-eks"

#   region              = var.region
#   master_prefix       = var.master_prefix
#   env_prefix          = var.env_prefix
#   app_prefix          = var.app_prefix
#   allowed_account_ids = var.allowed_account_ids

#   vpc_id                  = module.main_vpc.vpc_id
#   subnet_ids              = module.main_vpc.private_subnets
#   create_eks              = var.create_eks
#   cluster_version         = var.cluster_version
#   enable_irsa             = var.enable_irsa
#   eks_managed_node_groups = var.eks_managed_node_groups
#   autoscaling_average_cpu = var.autoscaling_average_cpu

#   tags = var.tags
# }

# module "aws_load_balancer_controller" {
#   source = "./modules/02-aws-load-balancer-controller"

#   region              = var.region
#   master_prefix       = var.master_prefix
#   env_prefix          = var.env_prefix
#   app_prefix          = var.app_prefix
#   allowed_account_ids = var.allowed_account_ids

#   cluster_name            = module.main_eks.cluster_name
#   ingress_controller_name = "aws-load-balancer-controller"

#   tags = var.tags

#   depends_on = [
#     module.main_eks
#   ]
# }

# module "ingress_nginx_controller" {
#   source = "./modules/03-ingress-nginx-controller"

#   region              = var.region
#   master_prefix       = var.master_prefix
#   env_prefix          = var.env_prefix
#   app_prefix          = var.app_prefix
#   allowed_account_ids = var.allowed_account_ids

#   cluster_name = module.main_eks.cluster_name

#   tags = var.tags

#   depends_on = [
#     module.aws_load_balancer_controller
#   ]
# }

# # module "cert_manager" {
# #   source = "./modules/04-cert-manager"

# #   region              = var.region
# #   master_prefix       = var.master_prefix
# #   env_prefix          = var.env_prefix
# #   app_prefix          = var.app_prefix
# #   allowed_account_ids = var.allowed_account_ids

# #   cluster_name = module.main_eks.cluster_name

# #   tags = var.tags

# #   depends_on = [
# #     module.ingress_nginx_controller
# #   ]
# # }

# module "kube_prometheus_stack" {
#   source = "./modules/05-kube-prometheus-stack"

#   region              = var.region
#   master_prefix       = var.master_prefix
#   env_prefix          = var.env_prefix
#   app_prefix          = var.app_prefix
#   allowed_account_ids = var.allowed_account_ids

#   cluster_name = module.main_eks.cluster_name

#   tags = var.tags

#   depends_on = [
#     module.ingress_nginx_controller
#   ]
# }

# module "sealed_secret" {
#   source = "./modules/06-sealed-secrets"

#   region              = var.region
#   master_prefix       = var.master_prefix
#   env_prefix          = var.env_prefix
#   app_prefix          = var.app_prefix
#   allowed_account_ids = var.allowed_account_ids

#   cluster_name = module.main_eks.cluster_name

#   tags = var.tags

#   depends_on = [
#     module.kube_prometheus_stack
#   ]
# }

# module "argocd" {
#   source = "./modules/07-argocd"

#   region              = var.region
#   master_prefix       = var.master_prefix
#   env_prefix          = var.env_prefix
#   app_prefix          = var.app_prefix
#   allowed_account_ids = var.allowed_account_ids

#   cluster_name = module.main_eks.cluster_name

#   tags = var.tags

#   depends_on = [
#     module.sealed_secret
#   ]
# }