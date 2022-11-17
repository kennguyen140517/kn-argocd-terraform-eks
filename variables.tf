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
  type        = list(any)
}

variable "allowed_account_ids" {
  description = "List of allowed AWSA account IDs to prevent yopu from mistakenly using an incorrect one (and potentially end up destroying a live environment)."
}

variable "number_of_az" {
  description   = "Number of Availability Zone"
  type          = number
  default       = 2
}

variable "cluster_version" {
  description = "EKS Kubernetes cluster version"
  type        = string
}

variable "create_eks" {
  description = "Controls if EKS resources should be created (it affects almost all resources)"
  type = bool
  default = true
}

variable "enable_irsa" {
  description = "Whether to create OpenID Connect Provider for EKS to enable IRSA"
  type = bool
  default = false
}

variable "vpc_cidr" {
  description = "CIDR block to be used in our VPC"
  type = string
}

variable "subnet_prefix_extension" {
  type        = number
  description = "CIDR block bits extension to calculate CIDR blocks of each subnetwork."
}

variable "zone_offset" {
  type        = number
  description = "CIDR block bits extension offset to calculate Public subnets, avoiding collisions with Private subnets."
}
