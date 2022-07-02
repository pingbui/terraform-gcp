output "project_name" {
  value = module.project-factory.project_name
}

output "project_id" {
  value = module.project-factory.project_id
}

output "project_number" {
  value = module.project-factory.project_number
}

output "domain" {
  value       = module.project-factory.domain
  description = "The organization's domain"
}

output "group_email" {
  value       = module.project-factory.group_email
  description = "The email of the G Suite group with group_name"
}

output "service_account_id" {
  value       = module.project-factory.service_account_id
  description = "The id of the default service account"
}

output "service_account_display_name" {
  value       = module.project-factory.service_account_display_name
  description = "The display name of the default service account"
}

output "service_account_email" {
  value       = module.project-factory.service_account_email
  description = "The email of the default service account"
}

output "service_account_name" {
  value       = module.project-factory.service_account_name
  description = "The fully-qualified name of the default service account"
}

output "service_account_unique_id" {
  value       = module.project-factory.service_account_unique_id
  description = "The unique id of the default service account"
}

output "api_s_account" {
  value       = module.project-factory.api_s_account
  description = "API service account email"
}

output "api_s_account_fmt" {
  value       = module.project-factory.api_s_account_fmt
  description = "API service account email formatted for terraform use"
}

output "enabled_apis" {
  description = "Enabled APIs in the project"
  value       = module.project-factory.enabled_apis
}

output "enabled_api_identities" {
  description = "Enabled API identities in the project"
  value       = module.project-factory.enabled_api_identities
}
