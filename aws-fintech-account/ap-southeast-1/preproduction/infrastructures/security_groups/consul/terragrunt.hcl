include {
  path = find_in_parent_folders()
}

terraform {
  source = "git::ssh://git@github.com/ardikabs/terraform-aws-sg.git?ref=v0.1.0"
}

dependency "vpc" {
  config_path = "../../vpc"
}

inputs = {
  group_name        = "consul"
  group_description = "Consul security group"

  vpc_id = dependency.vpc.outputs.vpc_id

  ingresses = [
    {
      self                     = null
      source_security_group_id = null
      cidr_blocks = [
        "172.18.0.0/16"
      ]

      rules = [
        "consul-server-8300-tcp",
        "consul-serflan-8301-tcp",
        "consul-serflan-8301-udp",
        "consul-serfwan-8302-tcp",
        "consul-serfwan-8302-udp",
        "consul-http-8500-tcp",
        "consul-dns-8600-tcp",
        "consul-dns-8600-udp"
      ]
    }
  ]
}
