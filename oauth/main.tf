terraform {
  required_providers {
    okta = {
      source = "oktadeveloper/okta"
      version = "~> 3.6"
    }
  }
}

provider "okta" {}

resource "okta_app_oauth"  "example" {
  label          = "example"
  type           = "web"
  response_types = ["token","code"]
  grant_types    = ["authorization_code","implicit"]
  redirect_uris  = ["http://localhost:8080"]
  consent_method = "REQUIRED"
}

output "client_id" {
    description  = "Client Identifier"
    value        = okta_app_oauth.example.client_id
}

output "client_secret" {
    description  = "Client Secret"
    value        = okta_app_oauth.example.client_secret
}