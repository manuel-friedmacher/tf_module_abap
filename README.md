# tf_module_template
Template for Terraform modules

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.14.0 |
| <a name="requirement_btp"></a> [btp](#requirement\_btp) | >= 1.22 |
| <a name="requirement_cloudfoundry"></a> [cloudfoundry](#requirement\_cloudfoundry) | >= 1.15 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_btp"></a> [btp](#provider\_btp) | >= 1.22 |
| <a name="provider_cloudfoundry"></a> [cloudfoundry](#provider\_cloudfoundry) | >= 1.15 |
| <a name="provider_time"></a> [time](#provider\_time) | n/a |

## Resources

| Name | Type |
|------|------|
| [btp_subaccount_entitlement.abap_compute_unit](https://registry.terraform.io/providers/SAP/btp/latest/docs/resources/subaccount_entitlement) | resource |
| [btp_subaccount_entitlement.abap_service_instance](https://registry.terraform.io/providers/SAP/btp/latest/docs/resources/subaccount_entitlement) | resource |
| [btp_subaccount_entitlement.hana_compute_unit](https://registry.terraform.io/providers/SAP/btp/latest/docs/resources/subaccount_entitlement) | resource |
| [btp_subaccount_entitlement.web_router](https://registry.terraform.io/providers/SAP/btp/latest/docs/resources/subaccount_entitlement) | resource |
| [btp_subaccount_subscription.abap_web_access](https://registry.terraform.io/providers/SAP/btp/latest/docs/resources/subaccount_subscription) | resource |
| [cloudfoundry_service_credential_binding.abap_service_key](https://registry.terraform.io/providers/cloudfoundry/cloudfoundry/latest/docs/resources/service_credential_binding) | resource |
| [cloudfoundry_service_instance.abap_env](https://registry.terraform.io/providers/cloudfoundry/cloudfoundry/latest/docs/resources/service_instance) | resource |
| [cloudfoundry_space.abap_space](https://registry.terraform.io/providers/cloudfoundry/cloudfoundry/latest/docs/resources/space) | resource |
| [cloudfoundry_space_role.space_developer](https://registry.terraform.io/providers/cloudfoundry/cloudfoundry/latest/docs/resources/space_role) | resource |
| [cloudfoundry_space_role.space_manager](https://registry.terraform.io/providers/cloudfoundry/cloudfoundry/latest/docs/resources/space_role) | resource |
| [time_sleep.wait_for_cf_permissions](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_abap_admin_email"></a> [abap\_admin\_email](#input\_abap\_admin\_email) | The email address of the ABAP system administrator. | `string` | n/a | yes |
| <a name="input_abap_is_development_allowed"></a> [abap\_is\_development\_allowed](#input\_abap\_is\_development\_allowed) | Flag indicating whether development is allowed on the ABAP system. | `bool` | `true` | no |
| <a name="input_abap_sid"></a> [abap\_sid](#input\_abap\_sid) | The system ID (SID) of the ABAP system. | `string` | `"A01"` | no |
| <a name="input_btp_platform_idp"></a> [btp\_platform\_idp](#input\_btp\_platform\_idp) | FQDN of the Platform Identity Provider. | `string` | n/a | yes |
| <a name="input_cf_administrator"></a> [cf\_administrator](#input\_cf\_administrator) | Email address of the user to be added to the Cloud Foundry space. | `string` | n/a | yes |
| <a name="input_cf_org_id"></a> [cf\_org\_id](#input\_cf\_org\_id) | ID of the Cloud Foundry organization. | `string` | n/a | yes |
| <a name="input_subaccount_id"></a> [subaccount\_id](#input\_subaccount\_id) | The ID of the subaccount where the ABAP system will be deployed. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_abap_dashboard_url"></a> [abap\_dashboard\_url](#output\_abap\_dashboard\_url) | The URL of the ABAP service instance dashboard. |
<!-- END_TF_DOCS -->
