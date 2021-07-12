output "service_name" {
  value = var.name
}

output "repository_name" {
  value = module.repository.name
}

output "stage_urls" {
  value = {
    for stage in module.stage :
    stage.name => stage.url
  }
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
}

output "stage_env_vars" {
  value = {
    for stage in module.stage :
    stage.name => stage.stage_env_vars
  }
}
