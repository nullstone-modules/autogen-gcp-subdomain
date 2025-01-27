# 0.4.5 (Jan 27, 2025)
* Add a random string to the end of the managed zone name so it is always unique.

# 0.4.4 (Dec 30, 2024)
* Removed trailing `.` from `outputs.name`.

# 0.4.3 (Dec 14, 2024)
* Removed enabling of certificate manager service, it is now done in the cert module.

# 0.4.2 (Dec 14, 2024)
* Enables certificate manager service in GCP project.

# 0.4.1 (Dec 14, 2024)
* Include `README.md` in published module.

# 0.4.0 (Dec 14, 2024)
* Added GCP-managed certificate that can be disabled with `var.disable_certificate`.
* Upgraded `ns` terraform provider to pull subdomain and fqdn from Nullstone using `ns_subdomain`.
* Added terraform lockfile.
