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

variable "cluster_name" {
  description = "EKS Kubernetes cluster name"
  type        = string
  default     = ""
}
