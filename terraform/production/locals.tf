locals {
  all_ipv4_ips = ["0.0.0.0/0"]
  office1_ips = ["123.123.123.123","123.123.123.123"]
  office2_ips = ["123.123.123.123","123.123.123.123"]
  do_vpc_ips = [module.network.ip_range]
  external_ips = [
    "123.123.123.123",
    "124.124.124.124",
  ]
  trusted_bastion_ips = concat(local.office1_ips, local.office2_ips, local.external_ips, local.do_vpc_ips)
}