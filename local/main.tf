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

resource "local_file" "cid" {
    content     = var.client_id
    filename = "${path.module}/cid.txt"
    file_permission = "0600"
}