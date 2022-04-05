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
      api_id           = stage.api_id
      websocket_api_id = stage.websocket_api_id
      api_resource_id  = stage.root_resource_id
      base_url         = stage.url
      websocket_url    = stage.websocket_url
      service_name     = var.repository_name
      service_slug     = var.path
      topic_arn        = stage.topic_arn
      bucket           = stage.bucket_name
      bucket_topic_arn = stage.s3_topic_arn
      role_arn         = stage.role_arn
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
