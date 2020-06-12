
terraform {
  extra_arguments "custom_vars" {
    commands = "${get_terraform_commands_that_need_vars()}"

    optional_var_files = [
      "${find_in_parent_folders("general.tfvars", "ignore")}",
      "${find_in_parent_folders("environment.tfvars", "ignore")}",
      "${find_in_parent_folders("domain.tfvars", "ignore")}",
      "${find_in_parent_folders("service.tfvars", "ignore")}",
      "${get_parent_terragrunt_dir()}/common.tfvars",
    ]
  }
}

remote_state {
  backend = "s3"
  config = {
    bucket         = "terragrunt-staging-sample-xxx5310234"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "ap-southeast-1"
    encrypt        = true
    dynamodb_table = "mylockdb"

    s3_bucket_tags = {
      ManagedBy = "terraform"
    }

    dynamodb_table_tags = {
      ManagedBy = "terraform"
    }
  }
}
