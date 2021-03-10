variable "alice_password" {
    type  = string
}

variable "bob_password" {
    type  = string
}

variable "api_token" {
    type  = string
}

module "group" {
  source = "./group"
  alice_password = var.alice_password
  bob_password = var.bob_password
}

module "oauth" {
  source = "./oauth"
}

module "local" {
  source        = "./local"
  client_id     = module.oauth.client_id
  client_secret = module.oauth.client_secret
  api_token     = var.api_token
}
