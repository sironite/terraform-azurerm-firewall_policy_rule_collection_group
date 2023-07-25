module "firewall_policy_rule_collection_group" {
  source  = "sironite/firewall_policy_rule_collection_group/azurerm"
  version = "X.X.X"

  collection_group_name = "example"
  firewall_policy_id    = azurerm_firewall_policy.this.id
  priority              = 100

  firewall_policy_rules = {
    network_rule_collections = {
      "example" = {
        name     = "example"
        priority = 100
        action   = "Allow"

        rules = {
          "example" = {
            name                  = "example"
            description           = "example"
            source_addresses      = [""]
            destination_addresses = [""]
          }
        }
      }
      "expample2" = {
        name     = "example2"
        priority = 100
        action   = "Allow"

        rules = {
          "example2" = {
            name                  = "example2"
            description           = "example2"
            source_addresses      = [""]
            destination_addresses = [""]
          }
        }
      }
    }
    application_rule_collections = {
      "example" = {
        name     = "example"
        priority = 100
        action   = "Allow"

        rules = {
          "example" = {
            name                  = "example"
            source_addresses      = [""]
            destination_fqdn_tags = [""]
            destination_fqdns     = [""]
            protocols = {
              "example" = {
                type = "TCP"
                port = 80
              }
            }
          }
        }
      }

    }
  }
}