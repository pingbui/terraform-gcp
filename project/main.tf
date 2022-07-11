locals {
  default_role = try(var.iam_roles[0], [])
  other_roles  = try(slice(var.iam_roles, 1, length(var.iam_roles)), [])
  s_account_fmt = var.create_project_sa ? format(
    "serviceAccount:%s",
    module.project-factory.service_account_email,
  ) : ""
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
  create_project_sa  = var.create_project_sa
  project_sa_name    = var.project_sa_name
  sa_role            = var.sa_role
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

## For service account:
resource "google_project_iam_binding" "sa" {
  for_each = var.create_project_sa ? toset(var.iam_roles) : []
  project  = var.project_id
  role     = each.value
  members  = [local.s_account_fmt]

  dynamic "condition" {
    for_each = var.condition == {} ? [] : [1]
    content {
      title       = try(var.condition.title, "Condition")
      description = try(var.condition.description, "Description")
      expression  = try(var.condition.expression, "request.time < timestamp(\"2020-01-01T00:00:00Z\")")
    }
  }
}

resource "google_service_account_key" "sa_key" {
  count              = var.create_project_sa && var.create_sa_key ? 1 : 0
  service_account_id = module.project-factory.service_account_id
  public_key_type    = "TYPE_X509_PEM_FILE"
  private_key_type   = "TYPE_GOOGLE_CREDENTIALS_FILE"
}
