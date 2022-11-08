terraform {
  required_version = ">=1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

module "hello_world" {
  source = "./modules/hello_world"
  prefix = "test"
}
