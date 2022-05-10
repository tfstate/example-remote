terraform {
  backend "http" {
    address        = "https://api.tfstate.dev/github/v1"
    lock_address   = "https://api.tfstate.dev/github/v1/lock"
    unlock_address = "https://api.tfstate.dev/github/v1/lock"
    lock_method    = "PUT"
    unlock_method  = "DELETE"
    username       = "tfstate/example-remote"
  }
}

data "terraform_remote_state" "example" {
  backend = "http"

  config = {
    address        = "https://api.tfstate.dev/github/v1"
    lock_address   = "https://api.tfstate.dev/github/v1/lock"
    unlock_address = "https://api.tfstate.dev/github/v1/lock"
    lock_method    = "PUT"
    unlock_method  = "DELETE"
    username       = "tfstate/example"
  }
}

resource "null_resource" "example" {
  triggers = {
    example_id = data.terraform_remote_state.example.outputs.null_resource_id
  }
}
