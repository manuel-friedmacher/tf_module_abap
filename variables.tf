variable "subaccount_id" {
  description = "The ID of the subaccount where the ABAP system will be deployed."
  type        = string
  validation {
    condition     = can(regex("^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$", var.subaccount_id))
    error_message = "subaccount_id must be a valid UUID."
  }
}

variable "btp_platform_idp" {
  description = "FQDN of the Platform Identity Provider."
  type        = string
  validation {
    condition     = can(regex("^([a-zA-Z0-9]([a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?\\.)+[a-zA-Z]{2,63}$", var.btp_platform_idp))
    error_message = "btp_platform_idp must be a valid FQDN."
  }
}

variable "cf_org_id" {
  description = "ID of the Cloud Foundry organization."
  type        = string
  validation {
    condition     = can(regex("^[a-zA-Z0-9._%+-]+$", var.cf_org_id))
    error_message = "cf_org_id must be a valid Cloud Foundry organization ID."
  }
}

variable "cf_administrator" {
  description = "Email address of the user to be added to the Cloud Foundry space."
  type        = string
  validation {
    condition     = can(regex("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$", var.cf_administrator))
    error_message = "cf_administrator must be a valid email address."
  }
}

variable "abap_sid" {
  type        = string
  description = "The system ID (SID) of the ABAP system."
  validation {
    condition     = can(regex("^[A-Z][A-Z0-9]{2}$", var.abap_sid))
    error_message = "Please provide a valid system ID (SID). It must consist of exactly three alphanumeric characters. Only uppercase letters are allowed. The first character must be a letter (not a digit). The ID does not have to be technically unique."
  }
  default = "A01"
}

variable "abap_admin_email" {
  description = "The email address of the ABAP system administrator."
  type        = string
  validation {
    condition     = can(regex("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$", var.abap_admin_email))
    error_message = "Please provide a valid email address for the ABAP system administrator."
  }
}

variable "abap_is_development_allowed" {
  description = "Flag indicating whether development is allowed on the ABAP system."
  type        = bool
  default     = true
}
