terraform {
  required_version = ">= 1.3.4"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "~> 2.15.0"
    }
    helm = {
      source = "hashicorp/helm"
      version = "~> 2.7.1"
    }
    time = {
      source = "hashicorp/time"
      version = "~> 0.9.1"
    }
  }
}