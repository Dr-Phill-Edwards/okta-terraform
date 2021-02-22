module "group" {
  source = "./group"
}

module "oauth" {
  source = "./oauth"
}

module "local" {
  source    = "./local"
  client_id = module.oauth.client_id
}

output "client_id" {
  description  = "Client Identifier"
  value        = module.oauth.client_id
}