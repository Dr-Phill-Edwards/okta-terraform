#module "group" {
#  source = "./group"
#}

module "oauth" {
  source = "./oauth"
}

module "local" {
  source    = "./local"
  client_id = module.oauth.client_id
  client_secret = module.oauth.client_secret
}

output "client_id" {
  description  = "Client Identifier"
  value        = module.oauth.client_id
}

output "client_secret" {
  description  = "Client Secret"
  value        = module.oauth.client_secret
}