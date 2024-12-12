output "name" {
  value       = local.subdomain_dns_name
  description = "string ||| The name of the created subdomain. (Format: '{{dns_name}}.{{domain}}')"
}

output "fqdn" {
  value       = local.subdomain_fqdn
  description = "string ||| The FQDN (fully-qualified domain name) for the created subdomain."
}

output "zone_id" {
  value       = google_dns_managed_zone.this.name
  description = "string ||| The zone ID of the AWS Route53 Zone for the created subdomain."
}

output "nameservers" {
  value       = google_dns_managed_zone.this.name_servers
  description = "list(string) ||| The list of nameservers of the AWS Route53 Zone for the created subdomain."
}

output "domain_name" {
  value       = local.subdomain_domain_name
  description = "string ||| The name of the root domain."
}

output "certificate_id" {
  value       = local.certificate_id
  description = "string ||| The ID of the Certificate in GCP Certificate Manager."
}

output "certificate_map_id" {
  value       = local.certificate_map_id
  description = "string ||| The ID of the Certificate Map in GCP Certificate Manager."
}
