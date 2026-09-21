locals {
  idp_platform_host   = split(".", var.btp_platform_idp)[0]
  idp_platform_origin = "${local.idp_platform_host}-platform"
}

# Assignment of entitlements for an SAP BTP ABAP Environment
resource "btp_subaccount_entitlement" "abap_service_instance" {
  subaccount_id = var.subaccount_id
  service_name  = "abap"
  plan_name     = "standard"
}
resource "btp_subaccount_entitlement" "abap_compute_unit" {
  subaccount_id = var.subaccount_id
  service_name  = "abap"
  plan_name     = "abap_compute_unit"
  amount        = 1
}
resource "btp_subaccount_entitlement" "hana_compute_unit" {
  subaccount_id = var.subaccount_id
  service_name  = "abap"
  plan_name     = "hana_compute_unit"
  amount        = 2
}
resource "btp_subaccount_entitlement" "web_router" {
  subaccount_id = var.subaccount_id
  service_name  = "abapcp-web-router"
  plan_name     = "default"
}

# Create the Cloud Foundry Space
resource "cloudfoundry_space" "abap_space" {
  name = "abap"
  org  = var.cf_org_id
}
resource "cloudfoundry_space_role" "space_manager" {
  username = var.cf_administrator
  origin   = local.idp_platform_origin
  type     = "space_manager"
  space    = cloudfoundry_space.abap_space.id
}
resource "cloudfoundry_space_role" "space_developer" {
  username = var.cf_administrator
  origin   = local.idp_platform_origin
  type     = "space_developer"
  space    = cloudfoundry_space.abap_space.id
}

# Create the BTP ABAP environment
data "cloudfoundry_service_plan" "abap_plan" {
  service_offering_name = "abap"
  name                  = "standard"
  depends_on            = [cloudfoundry_space_role.space_manager]
}
resource "cloudfoundry_service_instance" "abap_env" {
  name         = "abap-${trimspace(upper(var.abap_sid))}"
  space        = cloudfoundry_space.abap_space.id
  service_plan = data.cloudfoundry_service_plan.abap_plan.id
  type         = "managed"
  parameters = jsonencode({
    admin_email            = var.abap_admin_email
    sapsystemname          = trimspace(upper(var.abap_sid))
    is_development_allowed = tobool(var.abap_is_development_allowed)
    size_of_runtime        = 1
    size_of_persistence    = 2
  })
  timeouts = {
    create = "4h"
    delete = "4h"
    update = "4h"
  }
}

# Create a service key for the ABAP system
resource "cloudfoundry_service_credential_binding" "abap_service_key" {
  type             = "key"
  name             = join("_", ["sk", "abap", trimspace(upper(var.abap_sid))])
  service_instance = cloudfoundry_service_instance.abap_env.id
}

# Create a service instance for the ABAP web access
resource "btp_subaccount_subscription" "abap_web_access" {
  subaccount_id = var.subaccount_id
  app_name      = "abapcp-web-router"
  plan_name     = "default"
  depends_on    = [btp_subaccount_entitlement.web_router, cloudfoundry_service_instance.abap_env]
}
