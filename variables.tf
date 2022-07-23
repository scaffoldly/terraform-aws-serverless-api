variable "repository_name" {
  type        = string
  description = "The repository name"
}

variable "kms_stages" {
  type = map(
    object({
      key_id    = string
      key_alias = string
    })
  )
  default     = {}
  description = "Output of kms_stages from terraform-aws-bootstrap"
}

variable "api_gateway_stages" {
  type = map(
    object({
      api_gateway_domain           = string
      api_gateway_websocket        = optional(bool)
      api_gateway_websocket_domain = optional(string)
    })
  )
  description = "Output of api_gatway_stages from scaffoldly/terraform-aws-api-gateway"
}

variable "path" {
  type        = string
  description = "The desired path to the service in API Gateway"
}

variable "bucket_allow_public_access" {
  type        = bool
  default     = false
  description = "Allow Objects in the S3 bucket to have a Public ACL"
}
