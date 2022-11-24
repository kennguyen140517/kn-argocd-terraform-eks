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

variable "number_of_az" {
  description = "Number of Availability Zone"
  type        = number
  default     = 2
}

variable "allowed_account_ids" {
  description = "List of allowed AWSA account IDs to prevent yopu from mistakenly using an incorrect one (and potentially end up destroying a live environment)."
  type        = list(any)
}

variable "cluster_name" {
  description = "EKS Kubernetes cluster name"
  type        = string
  default     = ""
}

variable "ingress_controller_name" {
  type        = string
  description = "Ingress controller name"
}

