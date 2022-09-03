provider "kubernetes" {
  config_path = "./.kube/kubeconfig.json"
}

provider "helm" {
  kubernetes {
    config_path = "./.kube/kubeconfig.json"
  }
}
################################################################################
# namespace
################################################################################
resource "kubernetes_namespace" "example" {
  metadata {
    name = var.k8s_namespace_name
  }
}

################################################################################
# secret
################################################################################
resource "kubernetes_secret" "image_secret" {
  metadata {
    name      = var.k8s_secret_name
    namespace = var.k8s_namespace_name
  }

  type = var.k8s_secret_type

  data = {
    ".dockerconfigjson" = file("${path.module}/config/registrysecret.json")
  }
}

################################################################################
# workload
################################################################################
module "workload" {
  
  source = "./workload"
}
