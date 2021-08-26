output "service_name" {
  value       = var.path
  description = "Re-output of var.path"
}

output "repository_name" {
  value       = var.repository_name
  description = "Re-output of var.repository_name"
}

output "stage_config" {
  value = {
    for stage in module.stage :
    stage.name => {
      base_url     = stage.url
      repo_name    = var.repository_name
      service_name = var.path
    }
  }
  description = "A map of various properties for each stage, keyed by stage"
}

output "deployer_credentials" {
  value = {
    access_key = module.aws_iam.deployer_access_key
    secret_key = module.aws_iam.deployer_secret_key
  }
  sensitive   = true
  description = "The Access Key and Secret Key for Serverless API deployments for this repository"
}
