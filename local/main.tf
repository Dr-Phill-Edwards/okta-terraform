terraform {
  required_providers {
    local = {
      source = "local"
      version = "~> 2.1"
    }
  }
}

variable "client_id" {
    type  = string
}

variable "client_secret" {
    type  = string
}

variable "api_token" {
    type  = string
}

resource "local_file" "cid" {
    content     = var.client_id
    filename = "${path.module}/cid.txt"
    file_permission = "0600"
}

resource "local_file" "csecret" {
    content     = var.client_secret
    filename = "${path.module}/csecret.txt"
    file_permission = "0600"
}