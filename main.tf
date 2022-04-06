module "aws_iam" {
  source  = "scaffoldly/serverless-api-iam/aws"
  version = "1.0.11"

  repository_name = var.repository_name
}

module "stage" {
  source  = "scaffoldly/serverless-api-stage/aws"
  version = "1.0.22"

  for_each = var.api_gateway_stages

  domain          = each.value.api_gateway_domain
  repository_name = var.repository_name
  path            = var.path
  stage           = each.key

  websocket        = each.value.api_gateway_websocket
  websocket_domain = each.value.api_gateway_websocket_domain != null ? each.value.api_gateway_websocket_domain : ""
  stage_kms_key_id = lookup(var.kms_stages[each.key], "key_id", "")
}

