# autogen-gcp-subdomain

Nullstone module to create a GCP-managed Subdomain hosted on Nullstone's `nullstone.app` domain.

## Overview

This module creates a DNS Zone on Google Cloud DNS.

By default, this module will create an SSL certificate using GCP Certificate Manager.
This can be disabled by setting the variable `disable_certificate = true`.
This certificate is created for Cloud CDNs and Load Balancing (most common use case).
A certificate and certificate map are created and emitted as outputs for use to attach to a GCP Load Balancer.
