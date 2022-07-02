variable "org_id" {
  description = "The organization ID."
  type        = string
}

variable "domain" {
  description = "The domain name (optional)."
  type        = string
  default     = ""
}

variable "name" {
  description = "The name for the project"
  type        = string
}

variable "project_id" {
  description = "The ID to give the project. If not provided, the `name` will be used."
  type        = string
  default     = ""
}

variable "billing_account" {
  description = "The ID of the billing account to associate this project with"
  type        = string
}

variable "folder_id" {
  description = "The ID of a folder to host this project"
  type        = string
  default     = ""
}

variable "group_name" {
  description = "A group to control the project by being assigned group_role (defaults to project editor)"
  type        = string
  default     = ""
}

variable "group_role" {
  description = "The role to give the controlling group (group_name) over the project (defaults to project editor)"
  type        = string
  default     = "roles/editor"
}

variable "activate_apis" {
  description = "The list of apis to activate within the project"
  type        = list(string)
  default     = ["compute.googleapis.com"]
}

variable "labels" {
  description = "Map of labels for project"
  type        = map(string)
  default     = {}
}

variable "consumer_quotas" {
  description = "The quotas configuration you want to override for the project."
  type = list(object({
    service    = string,
    metric     = string,
    dimensions = map(string),
    limit      = string,
    value      = string,
  }))
  default = []
}

variable "essential_contacts" {
  description = "A mapping of users or groups to be assigned as Essential Contacts to the project, specifying a notification category"
  type        = map(list(string))
  default     = {}
}

variable "language_tag" {
  description = "Language code to be used for essential contacts notifications"
  type        = string
  default     = "en-US"
}

variable "user_emails" {
  description = "List of user emails"
  type        = list(string)
  default     = []
}

variable "iam_roles" {
  description = "List of iam roles assigned to users"
  type        = list(string)
  default     = []
}

variable "condition" {
  description = "The condition of roles"
  type        = map(string)
  default     = {}
}
