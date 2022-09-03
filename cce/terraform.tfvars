# basic
enterprise_project_id = "e29eb971-7d65-4e8f-b90f-120ba1401924"

# vpc
vpc_name = "vpc-example"
vpc_cidr = "172.20.0.0/16"

# vpc_subnet
vpc_subnet_name          = "vpc-subnet-example"
vpc_subnet_cidr          = "172.20.0.0/16"
vpc_subnet_gateway       = "172.20.0.1"
vpc_subnet_primary_dns   = "100.125.1.250"
vpc_subnet_secondary_dns = "100.125.21.250"

# vpc_eip
vpc_eip_publicip_type         = "5_bgp"
vpc_eip_bandwidth_name        = "vpc-eip-example"
vpc_eip_bandwidth_size        = 8
vpc_eip_bandwidth_share_type  = "PER"
vpc_eip_bandwidth_charge_mode = "traffic"

#cce_cluster
cce_cluster_name                          = "cce-cluster-example"
cce_cluster_version                       = "v1.21"
cce_cluster_flavor                        = "cce.s1.small"
cce_cluster_type                          = "VirtualMachine"
cce_cluster_charging_mode                 = "postPaid"
cce_cluster_auto_renew                    = "false"
cce_cluster_period_unit                   = "month"
cce_cluster_period                        = 1
cce_cluster_period_container_network_type = "vpc-router"
cce_cluster_period_kube_proxy_mode        = "iptables"

#cce_node
compute_keypair_name      = "compute-keypair-example"
compute_keypair_key_file  = "./key/private-key.pem"
cce_node_number           = 3
cce_node_names            = ["cce-node-exapmle1", "cce-node-exapmle2", "cce-node-exapmle3"]
cce_node_flavor           = "c6s.xlarge.2"
cce_node_root_volume_size = 100
cce_node_root_volume_type = "SAS"
cce_node_data_volume_size = 500
cce_node_data_volume_type = "SAS"