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

## Providers

## Modules

## Resources

## Inputs

## Outputs

<!-- END_TF_DOCS -->
