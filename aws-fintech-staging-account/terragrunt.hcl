terraform {
  extra_arguments "custom_vars" {
    commands = "${get_terraform_commands_that_need_vars()}"

    optional_var_files = [
      "${find_in_parent_folders("general.tfvars", "ignore")}",
      "${find_in_parent_folders("domain.tfvars", "ignore")}",
      "${find_in_parent_folders("env.tfvars", "ignore")}",
      "${get_parent_terragrunt_dir()}/common.tfvars",
    ]
  }

}

remote_state {
  backend = "s3"
  config = {
    bucket         = "default-terraform-state-ap-southeast-1-randomgeneratedstring"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "ap-southeast-1"
    encrypt        = true
    dynamodb_table = "default-terraform-state-ap-southeast-1-randomgeneratedstring"


    s3_bucket_tags = {
      ManagedBy = "terraform"
    }

    dynamodb_table_tags = {
      ManagedBy = "terraform"
    }
  }


}
