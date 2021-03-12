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
  type           = "browser"
  response_types = ["code"]
  grant_types    = ["authorization_code"]
  redirect_uris  = ["http://localhost:8080", "http://localhost:8080/login/callback"]
  login_uri      = "http://localhost:8080"
  consent_method = "REQUIRED"
}

output "app_id" {
    description  = "Application Identifier"
    value        = okta_app_oauth.example.id
}

output "client_id" {
    description  = "Client Identifier"
    value        = okta_app_oauth.example.client_id
}

output "client_secret" {
    description  = "Client Secret"
    value        = okta_app_oauth.example.client_secret
}