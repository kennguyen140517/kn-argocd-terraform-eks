variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
}

variable "region" {
  type = string
}

variable "master_prefix" {
  description = "Master prefix to be used for all AWS resources"
  type        = string
}

variable "env_prefix" {
  description = "Environment specific prefix to be used for all AWS resources"
  type        = string
}

variable "app_prefix" {
  description = "Application prefix for all AWS resources"
  type        = string
}

variable "allowed_account_ids" {
  description = "List of allowed AWSA account IDs to prevent yopu from mistakenly using an incorrect one (and potentially end up destroying a live environment)."
  type        = list(any)
}

variable "number_of_az" {
  description = "Number of Availability Zone"
  type        = number
  default     = 2
}

variable "cluster_version" {
  description = "EKS Kubernetes cluster version"
  type        = string
  default     = "1.24"
}

variable "create_eks" {
  description = "Controls if EKS resources should be created (it affects almost all resources)"
  type        = bool
  default     = true
}

variable "enable_irsa" {
  description = "Whether to create OpenID Connect Provider for EKS to enable IRSA"
  type        = bool
  default     = false
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "subnet_ids" {
  description = "List of IDs of private subnets"
  type        = list(string)
}

variable "eks_managed_node_groups" {
  type        = map(any)
  description = "Map of EKS managed node group definitions to create"
}

variable "autoscaling_average_cpu" {
  type        = number
  description = "Average CPU threshold to autoscale EKS EC2 instances"
}