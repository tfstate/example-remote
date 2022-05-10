# example-remote

This is an example repository using TFstate.dev.

In the `terraform {}` block of [`main.tf`](main.tf), there is an `http` backend which is configured as-per the instructions on [our website](https://tfstate.dev).

Also, there is a `terraform_remote_state` data source, which uses the state output from [`example`](https://github.com/tfstate/example).

Access to the `terraform_remote_state` can be configured using the `TF_HTTP_PASSWORD` enviornment variable:

```bash
export TF_HTTP_PASSWORD="{your-github-token}"
terraform plan
terraform apply
```
