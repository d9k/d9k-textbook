# DevOps: Infrastructure-As-a-Code

## Resource drift

Difference between the state file and the infrastrucrure state.

- :beginner: [Manage resource drift | Terraform | HashiCorp Developer](https://developer.hashicorp.com/terraform/tutorials/state/resource-drift)

```
$ terraform plan -refresh-only
. . . . .
Note: Objects have changed outside of Terraform

Terraform detected the following changes made outside of Terraform since the last "terraform apply":
. . . . .

$ terraform apply -refresh-only
```

If you ran terraform plan or terraform apply without the `-refresh-only` flag now, Terraform would attempt to revert your manual changes.

