include {
  path = find_in_parent_folders()
}

terraform {
  source = "git::ssh://git@github.com/ardikabs/terraform-aws-vpc.git?ref=v1.0.0"
}


inputs = {
  name = "fintech"

  vpc_cidr_block = "172.18.0.0/16"

  default_network                 = true
  enable_rds_subnet_group         = true
  enable_elasticache_subnet_group = true
  enable_redshift_subnet_group    = true

  tags = "${local.tags}"
}
