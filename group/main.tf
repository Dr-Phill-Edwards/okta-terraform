terraform {
  required_providers {
    okta = {
      source = "oktadeveloper/okta"
      version = "~> 3.6"
    }
  }
}

provider "okta" {}

variable "alice_password" {
    type  = string
}

variable "bob_password" {
    type  = string
}

resource "okta_user_type" "employee" {
    name         = "Employee"
    display_name = "Employee"
    description  = "Company Employee"
}

resource "okta_user_type" "administrator" {
    name         = "Administrator"
    display_name = "Administrator"
    description  = "System Administrator"
}

resource "okta_user_schema" "employee" {
    index       = "shirtSize"
    title       = "shirtSize"
    description = "Shirt Size"
    type        = "string"
    master      = "OKTA"
    enum        = ["S", "M", "L", "XL"]
    user_type   = okta_user_type.employee.id
}

resource "okta_user" "alice" {
    first_name  = "Alice"
    last_name   = "Sure"
    login       = "alice.sure@example.com"
    email       = "alice.sure@example.com"
    password    = var.alice_password
    user_type   = "Hero"
}

resource "okta_user" "bob" {
    first_name  = "Bob"
    last_name   = "Swift"
    login       = "bob.swift@example.com"
    email       = "bob.swift@example.com"
    password    = var.bob_password
    user_type   = "Employee"
}

resource "okta_group" "crypto" {
    name        = "Crypto"
    description = "Crypto Group"
    users       = [okta_user.alice.id,okta_user.bob.id]
}