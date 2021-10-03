<!-- BEGIN_TF_DOCS -->
[![Tests](https://github.com/netascode/terraform-aci-aaa/actions/workflows/test.yml/badge.svg)](https://github.com/netascode/terraform-aci-aaa/actions/workflows/test.yml)

# Terraform ACI AAA Module

Manages ACI AAA configuration

Location in GUI:
`Admin` » `AAA` » `Authentication` » `AAA`

## Examples

```hcl
module "aci_aaa" {
  source  = "netascode/aaa/aci"
  version = ">= 0.0.1"

  remote_user_login_policy = "assign-default-role"
  default_fallback_check   = true
  default_realm            = "tacacs"
  default_login_domain     = "ISE"
  console_realm            = "tacacs"
  console_login_domain     = "ISE"
}

```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aci"></a> [aci](#requirement\_aci) | >= 0.2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aci"></a> [aci](#provider\_aci) | >= 0.2.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_remote_user_login_policy"></a> [remote\_user\_login\_policy](#input\_remote\_user\_login\_policy) | Remote user login policy. Choices: `assign-default-role`, `no-login` | `string` | `"no-login"` | no |
| <a name="input_default_fallback_check"></a> [default\_fallback\_check](#input\_default\_fallback\_check) | Default fallback check. | `bool` | `false` | no |
| <a name="input_default_realm"></a> [default\_realm](#input\_default\_realm) | Default realm. Choices: `local`, `tacacs`. | `string` | `"local"` | no |
| <a name="input_default_login_domain"></a> [default\_login\_domain](#input\_default\_login\_domain) | Default login domain. | `string` | `""` | no |
| <a name="input_console_realm"></a> [console\_realm](#input\_console\_realm) | Console realm. Choices: `local`, `tacacs`. | `string` | `"local"` | no |
| <a name="input_console_login_domain"></a> [console\_login\_domain](#input\_console\_login\_domain) | Console login domain. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dn"></a> [dn](#output\_dn) | Distinguished name of `aaaAuthRealm` object. |

## Resources

| Name | Type |
|------|------|
| [aci_rest.aaaAuthRealm](https://registry.terraform.io/providers/netascode/aci/latest/docs/resources/rest) | resource |
| [aci_rest.aaaConsoleAuth](https://registry.terraform.io/providers/netascode/aci/latest/docs/resources/rest) | resource |
| [aci_rest.aaaDefaultAuth](https://registry.terraform.io/providers/netascode/aci/latest/docs/resources/rest) | resource |
<!-- END_TF_DOCS -->