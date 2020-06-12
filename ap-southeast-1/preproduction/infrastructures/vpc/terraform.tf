provider "aws" {
    version = "~> 2.0"
    region = "ap-southeast-1"
}

terraform {
    backend "s3" {}
}

