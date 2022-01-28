terraform {
  required_providers {
    test = {
      source = "terraform.io/builtin/test"
    }

    aci = {
      source  = "CiscoDevNet/aci"
      version = ">=2.0.0"
    }
  }
}

module "main" {
  source                   = "../.."
  remote_user_login_policy = "assign-default-role"
  default_fallback_check   = true
  default_realm            = "local"
  console_realm            = "local"
}

data "aci_rest_managed" "aaaAuthRealm" {
  dn = "uni/userext/authrealm"

  depends_on = [module.main]
}

resource "test_assertions" "aaaAuthRealm" {
  component = "aaaAuthRealm"

  equal "defRolePolicy" {
    description = "defRolePolicy"
    got         = data.aci_rest_managed.aaaAuthRealm.content.defRolePolicy
    want        = "assign-default-role"
  }
}

data "aci_rest_managed" "aaaDefaultAuth" {
  dn = "uni/userext/authrealm/defaultauth"

  depends_on = [module.main]
}

resource "test_assertions" "aaaDefaultAuth" {
  component = "aaaDefaultAuth"

  equal "fallbackCheck" {
    description = "fallbackCheck"
    got         = data.aci_rest_managed.aaaDefaultAuth.content.fallbackCheck
    want        = "true"
  }

  equal "realm" {
    description = "realm"
    got         = data.aci_rest_managed.aaaDefaultAuth.content.realm
    want        = "local"
  }
}

data "aci_rest_managed" "aaaConsoleAuth" {
  dn = "uni/userext/authrealm/consoleauth"

  depends_on = [module.main]
}

resource "test_assertions" "aaaConsoleAuth" {
  component = "aaaConsoleAuth"

  equal "realm" {
    description = "realm"
    got         = data.aci_rest_managed.aaaConsoleAuth.content.realm
    want        = "local"
  }
}
