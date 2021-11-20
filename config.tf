terraform {
  required_version = ">= 1.0.0, < 1.1.0"
  experiments      = [module_variable_optional_attrs]

  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}
