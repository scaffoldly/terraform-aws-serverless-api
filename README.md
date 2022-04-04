[![Maintained by Scaffoldly](https://img.shields.io/badge/maintained%20by-scaffoldly-blueviolet)](https://github.com/scaffoldly)
![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/scaffoldly/terraform-aws-serverless-api)
![Terraform Version](https://img.shields.io/badge/tf-%3E%3D0.15.0-blue.svg)

## Description

Configure a Serverless API based on the APIs configured in stage domains.

Basically a wrapper/loop for the following modules:

- scaffoldly/repository/github (1 per module)
- scaffoldly/serverless-api-iam/aws (1 per module)
- scaffoldly/serverless-api-stage/aws (1 per stage)
- scaffoldly/serverless-api-stage-secrets/github (1 per stage)

## Usage

```hcl
module "serverless_api" {
  source   = "./serverless-api"
  for_each = local.serverless_apis

  name          = each.key
  stage_domains = module.dns.stage_domains

  template  = lookup(each.value, "template", "scaffoldly/sls-rest-api-template")
  repo_name = lookup(each.value, "repo_name", null)

  depends_on = [
    module.aws_api_gateway
  ]
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0, < 1.1.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_aws_iam"></a> [aws\_iam](#module\_aws\_iam) | scaffoldly/serverless-api-iam/aws | 1.0.11 |
| <a name="module_stage"></a> [stage](#module\_stage) | scaffoldly/serverless-api-stage/aws | 1.0.18 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_gateway_stages"></a> [api\_gateway\_stages](#input\_api\_gateway\_stages) | Output of api\_gatway\_stages from scaffoldly/terraform-aws-api-gateway | <pre>map(<br>    object({<br>      api_gateway_domain           = string<br>      api_gateway_websocket        = optional(bool)<br>      api_gateway_websocket_domain = optional(string)<br>    })<br>  )</pre> | n/a | yes |
| <a name="input_path"></a> [path](#input\_path) | The desired path to the service in API Gateway | `string` | n/a | yes |
| <a name="input_repository_name"></a> [repository\_name](#input\_repository\_name) | The repository name | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_deployer_credentials"></a> [deployer\_credentials](#output\_deployer\_credentials) | The Access Key and Secret Key for Serverless API deployments for this repository |
| <a name="output_repository_name"></a> [repository\_name](#output\_repository\_name) | Re-output of var.repository\_name |
| <a name="output_service_name"></a> [service\_name](#output\_service\_name) | Re-output of var.path |
| <a name="output_stage_config"></a> [stage\_config](#output\_stage\_config) | A map of various properties for each stage, keyed by stage |
<!-- END_TF_DOCS -->
