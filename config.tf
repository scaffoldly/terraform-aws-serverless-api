terraform {
  required_version = ">= 0.15"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.33.0"
    }
    github = {
      source  = "integrations/github"
      version = "4.9.4"
    }
  }
}
