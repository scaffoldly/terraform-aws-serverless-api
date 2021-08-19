variable "repository_name" {
  type        = string
  description = "The repository name"
}

variable "api_gateway_stages" {
  type = map({
    api_gateway_domain = string
  })
  description = "Output of api_gatway_stages from scaffoldly/terraform-aws-api-gateway"
}

