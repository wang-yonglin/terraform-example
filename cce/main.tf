provider "huaweicloud" {}

################################################################################
# vpc
################################################################################
resource "huaweicloud_vpc" "example" {
  enterprise_project_id = var.enterprise_project_id
  name                  = var.vpc_name
  cidr                  = var.vpc_cidr
}

################################################################################
# vpc_subnet
################################################################################
resource "huaweicloud_vpc_subnet" "example" {
  vpc_id        = huaweicloud_vpc.example.id
  name          = var.vpc_subnet_name
  cidr          = var.vpc_subnet_cidr
  gateway_ip    = var.vpc_subnet_gateway
  primary_dns   = var.vpc_subnet_primary_dns
  secondary_dns = var.vpc_subnet_secondary_dns
}

################################################################################
# vpc_eip
################################################################################
resource "huaweicloud_vpc_eip" "example" {
  enterprise_project_id = var.enterprise_project_id
  publicip {
    type = var.vpc_eip_publicip_type
  }
  bandwidth {
    name        = var.vpc_eip_bandwidth_name
    size        = var.vpc_eip_bandwidth_size
    share_type  = var.vpc_eip_bandwidth_share_type
    charge_mode = var.vpc_eip_bandwidth_charge_mode
  }
}

################################################################################
# cce_cluster
################################################################################
resource "huaweicloud_cce_cluster" "example" {
  enterprise_project_id  = var.enterprise_project_id
  vpc_id                 = huaweicloud_vpc.example.id
  subnet_id              = huaweicloud_vpc_subnet.example.id
  eip                    = huaweicloud_vpc_eip.example.address
  name                   = var.cce_cluster_name
  cluster_version        = var.cce_cluster_version
  cluster_type           = var.cce_cluster_type
  flavor_id              = var.cce_cluster_flavor
  charging_mode          = var.cce_cluster_charging_mode
  auto_renew             = var.cce_cluster_auto_renew
  period                 = var.cce_cluster_period
  period_unit            = var.cce_cluster_period_unit
  container_network_type = var.cce_cluster_period_container_network_type
  kube_proxy_mode        = var.cce_cluster_period_kube_proxy_mode
}

################################################################################
# cce_node
################################################################################
data "huaweicloud_availability_zones" "example" {

}

resource "huaweicloud_compute_keypair" "example" {
  name     = var.compute_keypair_name
  key_file = var.compute_keypair_key_file
}

resource "huaweicloud_cce_node" "example" {
  count = var.cce_node_number

  cluster_id        = huaweicloud_cce_cluster.example.id
  name              = var.cce_node_names[count.index]
  flavor_id         = var.cce_node_flavor
  availability_zone = data.huaweicloud_availability_zones.example.names[0]
  key_pair          = huaweicloud_compute_keypair.example.name

  root_volume {
    size       = var.cce_node_root_volume_size
    volumetype = var.cce_node_root_volume_type
  }

  data_volumes {
    size       = var.cce_node_data_volume_size
    volumetype = var.cce_node_data_volume_type
  }
}


