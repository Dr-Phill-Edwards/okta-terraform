terraform {
  required_providers {
    okta = {
      source = "oktadeveloper/okta"
      version = "~> 3.6"
    }
  }
}

provider "okta" {}

resource "okta_user_type" "hero" {
    name         = "Hero"
    display_name = "Hero"
    description  = "Marvel Hero"
}

resource "okta_user_schema" "hero" {
    index       = "shirtSize"
    title       = "shirtSize"
    description = "Shirt Size"
    type        = "string"
    master      = "OKTA"
    enum        = ["S", "M", "L", "XL"]
    user_type   = okta_user_type.hero.id
}

resource "okta_user" "superman" {
    first_name  = "Clark"
    last_name   = "Kent"
    login       = "clark.kent@example.com"
    email       = "clark.kent@example.com"
    user_type   = "Hero"
}

resource "okta_group" "example" {
    name        = "Example"
    description = "Example group"
    users       = [okta_user.superman.id]
}