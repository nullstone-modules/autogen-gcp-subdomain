# autogen-gcp-subdomain

Nullstone module creating a GCP Subdomain from a Nullstone-generated subdomain (e.g. `random-slug.nullstone.app`).

## Variables

None

## Outputs

- `name: string` - The name that precedes the domain name for the created subdomain.
- `fqdn: string` - The FQDN (fully-qualified domain name) for the created subdomain.
- `zone_id: string` - The zone name of the GCP Managed DNS Zone for the created subdomain.
- `nameservers: list(string)` - The list of nameservers of the GCP Managed DNS Zone for the created subdomain.
- `domain_name: string` - The name of the root domain.
- `domain_zone_id: string` - The zone ID of the root domain.
