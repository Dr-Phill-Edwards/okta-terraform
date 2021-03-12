terraform {
  required_providers {
    docker = {
      source = "terraform-providers/docker"
    }
  }
}

provider "docker" {}

variable "client_id" {
    type  = string
}

variable "client_secret" {
    type  = string
}

variable "api_token" {
    type  = string
}

variable "domain" {
    type  = string
}

resource "docker_container" "okta" {
  image = "okta:latest"
  name  = "okta"
  ports {
    internal = 8080
    external = 8080
  }
  env = [
    "OKTA_DOMAIN=${var.domain}",
    "OKTA_CLIENT_ID=${var.client_id}",
    "OKTA_API_TOKEN=${var.api_token}"
  ]
}