################################################################################
# basic
################################################################################
variable "enterprise_project_id" {
  type        = string
  description = "企业项目ID"
}

################################################################################
# vpc
################################################################################
variable "vpc_name" {
  type        = string
  description = "VPC的名称。租户名称不能重复。由数字、字母、下划线、连字符组成,长度不超过64个字符。"
}

variable "vpc_cidr" {
  type        = string
  description = "VPC中可使用的子网范围。取值范围为10.0.0.0/8 ~ 10.255.255.0/24、172.16.0.0/12 ~ 172.31.255.0/24或192.168.0.0/16 ~ 192.168.255.0/24"
}

################################################################################
# vpc_subnet
################################################################################
variable "vpc_subnet_name" {
  type        = string
  description = "子网名称。字符串形式,长度范围是1 ~ 64,可以包含字母、数字、“_”和“-”。"
}

variable "vpc_subnet_cidr" {
  type        = string
  description = "子网所在的网段。格式为CIDR,必须在VPC的CIDR块内。子网掩码不能大于28。改变它会创建一个新的子网。"
}

variable "vpc_subnet_gateway" {
  type        = string
  description = "子网的网关。必须是子网内的合法IP地址。改变它会创建一个新的子网。"
}

variable "vpc_subnet_primary_dns" {
  type        = string
  description = "子网内DNS服务器1的IP地址。必须是合法的IP地址"
}

variable "vpc_subnet_secondary_dns" {
  type        = string
  description = "子网内DNS服务器2的IP地址。必须是合法的IP地址"
}

################################################################################
# vpc_eip
################################################################################
variable "vpc_eip_publicip_type" {
  type        = string
  description = "EIP类型。取值包括5_bgp(动态BGP)和5_sbgp(静态BGP)，缺省值为5_bgp。更改此属性将创建一个新的资源。"
}

variable "vpc_eip_bandwidth_name" {
  type        = string
  description = "带宽名称,长度范围为1 ~ 64个字符, 由字母、数字、“_”、“-”组成。当share_type为PER时必选"
}

variable "vpc_eip_bandwidth_size" {
  type        = number
  description = "他的带宽大小。取值范围为1 ~ 300mbit /s。当share_type为PER时必选"
}

variable "vpc_eip_bandwidth_share_type" {
  type        = string
  description = "带宽是专用的还是共享的。更改此属性将创建一个新的资源 PER专用带宽/WHOLE共享带宽"
}

variable "vpc_eip_bandwidth_charge_mode" {
  type        = string
  description = "带宽是按流量计费还是按带宽大小计费。取值为“traffic”或“bandwidth”。更改此属性将创建一个新的资源。"
}

################################################################################
# cce_cluster
################################################################################
variable "cce_cluster_name" {
  type        = string
  description = "集群名称。修改此参数将创建一个新的集群资源。"
}

variable "cce_cluster_version" {
  type        = string
  description = "集群版本，默认为支持的最新版本。修改此参数将创建一个新的集群资源。"
}

variable "cce_cluster_flavor" {
  type        = string
  description = "集群的规格。修改此参数将创建一个新的集群资源。"
}

variable "cce_cluster_type" {
  type        = string
  description = "集群类型,可能的值是VirtualMachine和ARM64。默认为VirtualMachine。修改此参数将创建一个新的集群资源。"
}

variable "cce_cluster_charging_mode" {
  type        = string
  description = "CCE集群的计费模式。有效值为prePaid和postPaid,默认为postPaid。修改此参数将创建一个新的集群资源。"
}

variable "cce_cluster_auto_renew" {
  type        = string
  description = "是否启用自动更新功能。有效值为true和false。修改此参数将创建一个新的集群资源。"
}

variable "cce_cluster_period" {
  type        = number
  description = "CCE集群的计费周期。当“period_unit”为“月”时,取值范围为1 ~ 9。当输入“period_unit”为“year”时,取值范围为1 ~ 3。当“charging_mode”设置为“prePaid”时,该参数必选。修改此参数将创建一个新的集群资源。"
}

variable "cce_cluster_period_unit" {
  type        = string
  description = "CCE集群的充电周期单位。有效值为month和year。当“charging_mode”设置为“prePaid”时，该参数必选。修改此参数将创建一个新的集群资源。"
}

variable "cce_cluster_period_container_network_type" {
  type        = string
  description = "容器网络类型"
}

variable "cce_cluster_period_kube_proxy_mode" {
  type        = string
  description = "指定业务转发方式。修改此参数将创建一个新的集群资源"
}

################################################################################
# cce_node
################################################################################
variable "compute_keypair_name" {
  type        = string
  description = "密钥名称"
}

variable "compute_keypair_key_file" {
  type        = string
  description = "私钥存放目录"
}

variable "cce_node_number" {
  type        = number
  description = "节点数量"
}

variable "cce_node_names" {
  type        = list(string)
  description = "节点名称: 数量和number要匹配"
}

variable "cce_node_flavor" {
  type        = string
  description = "节点规格"
}

variable "cce_node_root_volume_size" {
  type        = number
  description = "系统盘的配置信息大小"
}

variable "cce_node_root_volume_type" {
  type        = string
  description = "系统盘的配置信息类型"
}

variable "cce_node_data_volume_size" {
  type        = number
  description = "数据盘的配置信息大小"
}

variable "cce_node_data_volume_type" {
  type        = string
  description = "数据盘的配置信息类型"
}
