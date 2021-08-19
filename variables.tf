variable "repository_name" {
  type        = string
  description = "The repository name"
}

variable "api_gateway_stages" {
  type = map(
    object({
      api_gateway_domain = string
    })
  )
  description = "Output of api_gatway_stages from scaffoldly/terraform-aws-api-gateway"
}

variable "path" {
  type        = string
  description = "The desired path to the service in API Gateway"
}
