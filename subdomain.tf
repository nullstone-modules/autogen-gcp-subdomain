resource "ns_autogen_subdomain" "autogen_subdomain" {
  subdomain_id = data.ns_workspace.this.block_id
  env          = data.ns_workspace.this.env_name
}

resource "google_dns_managed_zone" "this" {
  name     = data.ns_workspace.this.block_ref
  dns_name = ns_autogen_subdomain.autogen_subdomain.fqdn
  labels   = { for k, v in data.ns_workspace.this.tags : lower(k) => lower(v) }
}

resource "ns_autogen_subdomain_delegation" "to_aws" {
  subdomain_id = data.ns_workspace.this.block_id
  env          = data.ns_workspace.this.env_name
  nameservers  = google_dns_managed_zone.this.name_servers
}
