module "aws_iam" {
  source  = "scaffoldly/serverless-api-iam/aws"
  version = "1.0.1"

  repository_name = var.repository_name
}

module "stage" {
  source  = "scaffoldly/serverless-api-stage/aws"
  version = "1.0.2"

  for_each = var.api_gateway_stages

  domain          = each.value.api_gateway_domain
  repository_name = var.repository_name
  path            = var.path
  stage           = each.key
}

# TODO Secrets
# module "secrets" {
#   source  = "scaffoldly/serverless-api-stage-secrets/github"
#   version = "0.15.1"

#   for_each = module.stage

#   stage                         = each.key
#   repository_name               = var.repository_name
#   deployer_aws_access_key       = module.aws_iam.deployer_access_key
#   deployer_aws_secret_key       = module.aws_iam.deployer_secret_key
#   aws_rest_api_id               = each.value.api_id
#   aws_rest_api_root_resource_id = each.value.root_resource_id
# }
