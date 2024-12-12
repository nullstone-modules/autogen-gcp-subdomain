// TODO: Upgrade ns provider and use datasource to retrieve dns_name and fqdn from Nullstone APIs
resource "ns_autogen_subdomain" "autogen_subdomain" {
  subdomain_id = data.ns_workspace.this.block_id
  env_id       = data.ns_workspace.this.env_id
}

locals {
  subdomain_domain_name = ns_autogen_subdomain.autogen_subdomain.domain_name
  subdomain_dns_name = trimsuffix(ns_autogen_subdomain.autogen_subdomain.fqdn, ".")
  subdomain_fqdn        = ns_autogen_subdomain.autogen_subdomain.fqdn
  subdomain_zone_id     = google_dns_managed_zone.this.name
}

resource "google_project_service" "dns" {
  service                    = "dns.googleapis.com"
  disable_dependent_services = false
  disable_on_destroy         = false
}

resource "google_dns_managed_zone" "this" {
  name     = data.ns_workspace.this.block_ref
  dns_name = ns_autogen_subdomain.autogen_subdomain.fqdn
  labels   = { for k, v in data.ns_workspace.this.tags : lower(k) => lower(v) }

  depends_on = [google_project_service.dns]
}

resource "ns_autogen_subdomain_delegation" "to_gcp" {
  subdomain_id = data.ns_workspace.this.block_id
  env_id       = data.ns_workspace.this.env_id
  nameservers  = google_dns_managed_zone.this.name_servers
}
