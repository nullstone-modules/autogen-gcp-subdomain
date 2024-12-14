data "ns_subdomain" "this" {
  stack_id = data.ns_workspace.this.stack_id
  block_id = data.ns_workspace.this.block_id
  env_id   = data.ns_workspace.this.env_id
}

locals {
  fqdn                  = data.ns_subdomain.this.fqdn
  subdomain_domain_name = data.ns_subdomain.this.domain_name
}

resource "google_dns_managed_zone" "this" {
  name     = data.ns_workspace.this.block_ref
  dns_name = local.fqdn
  labels   = { for k, v in data.ns_workspace.this.tags : lower(k) => lower(v) }

  depends_on = [google_project_service.dns]
}

locals {
  // zone_id refers to google_dns_managed_zone.this.name; however, we need this variable to wait on the resource to be created
  // We're going to take google_dns_managed_zone.this.id and parse out the name (since id is computed during creation)
  // Format: projects/{{project}}/managedZones/{{name}}
  subdomain_zone_id = regex("^projects/[^/]+/managedZones/([^/]+)$", google_dns_managed_zone.this.id)[0]

  subdomain_name        = google_dns_managed_zone.this.dns_name
  subdomain_nameservers = [for ns in google_dns_managed_zone.this.name_servers : trimsuffix(ns, ".")]
}

resource "ns_autogen_subdomain_delegation" "to_gcp" {
  subdomain_id = data.ns_workspace.this.block_id
  env_id       = data.ns_workspace.this.env_id
  nameservers  = google_dns_managed_zone.this.name_servers
}
