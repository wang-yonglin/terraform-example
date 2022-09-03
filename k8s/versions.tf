terraform {
  required_version = ">= 0.13.1"
  
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.13.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.6.1"
    }
  }
}