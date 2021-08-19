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
