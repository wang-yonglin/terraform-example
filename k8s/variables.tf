variable "k8s_namespace_name" {
  type        = string 
  description = "命名空间名称"
}

variable "k8s_secret_name" {
  type        = string 
  description = "密钥名称"
}

variable "k8s_secret_type" {
  type        = string 
  description = "密钥类型"
}