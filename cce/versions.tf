terraform {
  required_version = ">= 0.13.1"

  required_providers {
    huaweicloud = {
      source  = "huaweicloud/huaweicloud"
      version = "1.40.0"
    }
  }
}