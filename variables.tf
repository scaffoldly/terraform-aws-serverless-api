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
variable "bucket_name" {
  type        = string
  default     = ""
  description = "Set the bucket name, default: var.stage-var.repository_name"
}
variable "saml_trust" {
  type = object({
    trust_actions                 = list(string)
    trust_principal_identifiers   = list(string)
    trust_principal_type          = string
    trust_condition_saml_test     = string
    trust_condition_saml_variable = string
    trust_condition_saml_values   = list(string)
    }
  )
  description = "Output of trust from saml-to/iam/aws module"
  default     = null
}