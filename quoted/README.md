This example shows that checkov can evaluate quote expansions `local.ssh_ingress["${var.env}"]` and will read by-default `terraform.tfvars`.  Use `--var-file pass.tfvars` to make things pass.
