
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
  group_name        = "http-80-443"
  group_description = "Default HTTP security group"

  vpc_id = dependency.vpc.outputs.vpc_id

  ingresses = [
    {
      self                     = null
      source_security_group_id = null
      cidr_blocks = [
        "0.0.0.0/0"
      ]

      rules = [
        "http-80-tcp",
        "https-443-tcp"
      ]
    }
  ]
}
