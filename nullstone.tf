terraform {
  required_providers {
    ns = {
      source = "nullstone-io/ns"
    }
  }
}

data "ns_workspace" "this" {}

// Generate a random suffix to ensure uniqueness of resources
resource "random_string" "resource_suffix" {
  length  = 5
  lower   = true
  upper   = false
  numeric = false
  special = false
}

locals {
  labels        = {for key, value in data.ns_workspace.this.tags : lower(key) => value}
  block_ref     = data.ns_workspace.this.block_ref
  resource_name = "${local.block_ref}-${random_string.resource_suffix.result}"
}
