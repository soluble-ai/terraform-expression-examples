# terraform-expression-examples

Terraform example using HCL expressions.

All these examples create an ingress `aws_security_group_rule` on port 22 on an existing security group named `test-sg`.

Checkov has a rule `CKV_AWS_24: "Ensure no security groups allow ingress from 0.0.0.0:0 to port 22"` that verifies this.

The `var*` examples set the ingress cidr_block to `var.ssh_ingress`.

The `local*` examples set the ingress cidr_block via lookup in a `locals` table.

The `func*` examples use string functions.

If the example contains a `.tfvars` file that file can be used to make the example pass or fail.  (Run either `checkov` or `soluble` with the `--var-file` option, e.g. `soluble tf-scan -d . --var-file pass.tfvars`.)
