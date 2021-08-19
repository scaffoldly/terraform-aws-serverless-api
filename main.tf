module "aws_iam" {
  source  = "scaffoldly/serverless-api-iam/aws"
  version = "0.15.3"

  repository_name = var.repository.name

  depends_on = [
    module.repository
  ]
}

module "stage" {
  source  = "scaffoldly/serverless-api-stage/aws"
  version = "0.15.2"

  for_each = var.stage_domains

  domain         = lookup(each.value, "serverless_api_domain", "unknown-domain")
  stage_env_vars = lookup(each.value, "stage_env_vars", {})

  name  = var.name
  stage = each.key

  repository_name = module.repository.name

  depends_on = [
    module.repository
  ]
}

module "secrets" {
  source  = "scaffoldly/serverless-api-stage-secrets/github"
  version = "0.15.1"

  for_each = module.stage

  stage                         = each.key
  repository_name               = module.repository.name
  deployer_aws_access_key       = module.aws_iam.deployer_access_key
  deployer_aws_secret_key       = module.aws_iam.deployer_secret_key
  aws_rest_api_id               = each.value.api_id
  aws_rest_api_root_resource_id = each.value.root_resource_id

  depends_on = [
    module.repository
  ]
}
