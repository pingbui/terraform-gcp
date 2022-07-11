## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.21.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_project-factory"></a> [project-factory](#module\_project-factory) | terraform-google-modules/project-factory/google | 13.0.0 |

## Resources

| Name | Type |
|------|------|
| [google_project_iam_binding.sa](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_binding) | resource |
| [google_project_iam_binding.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_binding) | resource |
| [google_project_iam_member.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_activate_apis"></a> [activate\_apis](#input\_activate\_apis) | The list of apis to activate within the project | `list(string)` | <pre>[<br>  "compute.googleapis.com"<br>]</pre> | no |
| <a name="input_billing_account"></a> [billing\_account](#input\_billing\_account) | The ID of the billing account to associate this project with | `string` | n/a | yes |
| <a name="input_condition"></a> [condition](#input\_condition) | The condition of roles | `map(string)` | `{}` | no |
| <a name="input_consumer_quotas"></a> [consumer\_quotas](#input\_consumer\_quotas) | The quotas configuration you want to override for the project. | <pre>list(object({<br>    service    = string,<br>    metric     = string,<br>    dimensions = map(string),<br>    limit      = string,<br>    value      = string,<br>  }))</pre> | `[]` | no |
| <a name="input_create_project_sa"></a> [create\_project\_sa](#input\_create\_project\_sa) | Whether the default service account for the project shall be created | `bool` | `true` | no |
| <a name="input_domain"></a> [domain](#input\_domain) | The domain name (optional). | `string` | `""` | no |
| <a name="input_essential_contacts"></a> [essential\_contacts](#input\_essential\_contacts) | A mapping of users or groups to be assigned as Essential Contacts to the project, specifying a notification category | `map(list(string))` | `{}` | no |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | The ID of a folder to host this project | `string` | `""` | no |
| <a name="input_group_name"></a> [group\_name](#input\_group\_name) | A group to control the project by being assigned group\_role (defaults to project editor) | `string` | `""` | no |
| <a name="input_group_role"></a> [group\_role](#input\_group\_role) | The role to give the controlling group (group\_name) over the project (defaults to project editor) | `string` | `"roles/editor"` | no |
| <a name="input_iam_roles"></a> [iam\_roles](#input\_iam\_roles) | List of iam roles assigned to users | `list(string)` | `[]` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | Map of labels for project | `map(string)` | `{}` | no |
| <a name="input_language_tag"></a> [language\_tag](#input\_language\_tag) | Language code to be used for essential contacts notifications | `string` | `"en-US"` | no |
| <a name="input_name"></a> [name](#input\_name) | The name for the project | `string` | n/a | yes |
| <a name="input_org_id"></a> [org\_id](#input\_org\_id) | The organization ID. | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The ID to give the project. If not provided, the `name` will be used. | `string` | `""` | no |
| <a name="input_project_sa_name"></a> [project\_sa\_name](#input\_project\_sa\_name) | Default service account name for the project. | `string` | `"project-service-account"` | no |
| <a name="input_sa_role"></a> [sa\_role](#input\_sa\_role) | A role to give the default Service Account for the project (defaults to none) | `string` | `""` | no |
| <a name="input_user_emails"></a> [user\_emails](#input\_user\_emails) | List of user emails | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_api_s_account"></a> [api\_s\_account](#output\_api\_s\_account) | API service account email |
| <a name="output_api_s_account_fmt"></a> [api\_s\_account\_fmt](#output\_api\_s\_account\_fmt) | API service account email formatted for terraform use |
| <a name="output_domain"></a> [domain](#output\_domain) | The organization's domain |
| <a name="output_enabled_api_identities"></a> [enabled\_api\_identities](#output\_enabled\_api\_identities) | Enabled API identities in the project |
| <a name="output_enabled_apis"></a> [enabled\_apis](#output\_enabled\_apis) | Enabled APIs in the project |
| <a name="output_group_email"></a> [group\_email](#output\_group\_email) | The email of the G Suite group with group\_name |
| <a name="output_project_id"></a> [project\_id](#output\_project\_id) | n/a |
| <a name="output_project_name"></a> [project\_name](#output\_project\_name) | n/a |
| <a name="output_project_number"></a> [project\_number](#output\_project\_number) | n/a |
| <a name="output_service_account_display_name"></a> [service\_account\_display\_name](#output\_service\_account\_display\_name) | The display name of the default service account |
| <a name="output_service_account_email"></a> [service\_account\_email](#output\_service\_account\_email) | The email of the default service account |
| <a name="output_service_account_id"></a> [service\_account\_id](#output\_service\_account\_id) | The id of the default service account |
| <a name="output_service_account_name"></a> [service\_account\_name](#output\_service\_account\_name) | The fully-qualified name of the default service account |
| <a name="output_service_account_unique_id"></a> [service\_account\_unique\_id](#output\_service\_account\_unique\_id) | The unique id of the default service account |
