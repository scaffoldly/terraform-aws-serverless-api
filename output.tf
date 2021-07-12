output "service_name" {
  value       = var.name
  description = "Re-output of var.name"
}

output "repository_name" {
  value       = module.repository.name
  description = "The created repository name (within the organization)"
}

output "stage_urls" {
  value = {
    for stage in module.stage :
    stage.name => stage.url
  }
  description = "(Deprecated) A map of all the URLs created keyed by stage"
}

output "stage_config" {
  value = {
    for stage in module.stage :
    stage.name => {
      base_url     = stage.url
      repo_name    = module.repository.name
      service_name = var.name
    }
  }
  description = "A map of various properties for each stage, keyed by stage"
}

output "stage_env_vars" {
  value = {
    for stage in module.stage :
    stage.name => stage.stage_env_vars
  }
  description = "The combined environment variables for each stage, keyed by stage"
}
