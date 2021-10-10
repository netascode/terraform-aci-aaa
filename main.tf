resource "aci_rest" "aaaAuthRealm" {
  dn         = "uni/userext/authrealm"
  class_name = "aaaAuthRealm"
  content = {
    defRolePolicy = var.remote_user_login_policy
  }
}

resource "aci_rest" "aaaDefaultAuth" {
  dn         = "${aci_rest.aaaAuthRealm.dn}/defaultauth"
  class_name = "aaaDefaultAuth"
  content = {
    fallbackCheck = var.default_fallback_check ? "true" : "false"
    realm         = var.default_realm
    providerGroup = var.default_realm == "tacacs" ? var.default_login_domain : null
  }
}

resource "aci_rest" "aaaConsoleAuth" {
  dn         = "${aci_rest.aaaAuthRealm.dn}/consoleauth"
  class_name = "aaaConsoleAuth"
  content = {
    realm         = var.console_realm
    providerGroup = var.console_realm == "tacacs" ? var.console_login_domain : null
  }
}
