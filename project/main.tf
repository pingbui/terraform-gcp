locals {
  default_role = try(var.iam_roles[0], [])
  other_roles  = try(slice(var.iam_roles, 1, length(var.iam_roles)), [])
}

module "project-factory" {
  source  = "terraform-google-modules/project-factory/google"
  version = "13.0.0"

  name               = var.name
  domain             = var.domain
  project_id         = var.project_id
  org_id             = var.org_id
  folder_id          = var.folder_id
  billing_account    = var.billing_account
  activate_apis      = var.activate_apis
  labels             = var.labels
  group_name         = var.group_name
  group_role         = var.group_role
  essential_contacts = var.essential_contacts
  consumer_quotas    = var.consumer_quotas
}

resource "google_project_iam_member" "this" {
  for_each = toset(var.user_emails)
  project  = var.project_id
  role     = local.default_role
  member   = "user:${each.value}"

  dynamic "condition" {
    for_each = var.condition == {} ? [] : [1]
    content {
      title       = try(var.condition.title, "Condition")
      description = try(var.condition.description, "Description")
      expression  = try(var.condition.expression, "request.time < timestamp(\"2020-01-01T00:00:00Z\")")
    }
  }
}

resource "google_project_iam_binding" "this" {
  for_each = toset(local.other_roles)
  project  = var.project_id
  role     = each.value
  members  = formatlist("user:%s", var.user_emails)

  dynamic "condition" {
    for_each = var.condition == {} ? [] : [1]
    content {
      title       = try(var.condition.title, "Condition")
      description = try(var.condition.description, "Description")
      expression  = try(var.condition.expression, "request.time < timestamp(\"2020-01-01T00:00:00Z\")")
    }
  }
}
