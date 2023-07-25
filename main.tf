resource "azurerm_firewall_policy_rule_collection_group" "this" {
  name               = var.collection_group_name
  firewall_policy_id = var.firewall_policy_id
  priority           = var.priority


  dynamic "application_rule_collection" {
    for_each = try(var.firewall_policy_rules.application_rule_collections, {})

    content {
      name     = application_rule_collection.value.name
      priority = application_rule_collection.value.priority
      action   = application_rule_collection.value.action

      dynamic "rule" {
        for_each = try(application_rule_collection.value.rules, {})

        content {
          name                  = rule.value.name
          source_addresses      = try(rule.value.source_addresses, null)
          source_ip_groups      = try(rule.value.source_ip_groups, null)
          destination_fqdn_tags = try(rule.value.destination_fqdn_tags, null)
          destination_fqdns     = try(rule.value.destination_fqdns, null)

          dynamic "protocols" {
            for_each = try(rule.value.protocols, {})

            content {
              type = protocols.value.type
              port = try(protocols.value.port, null)
            }
          }
        }
      }
    }
  }

  dynamic "network_rule_collection" {
    for_each = try(each.value.network_rule_collections, {})

    content {
      name     = network_rule_collection.value.name
      priority = network_rule_collection.value.priority
      action   = network_rule_collection.value.action

      dynamic "rule" {
        for_each = try(network_rule_collection.value.rules, {})

        content {
          name                  = rule.value.name
          description           = try(rule.value.description, null)
          source_addresses      = try(rule.value.source_addresses, null)
          source_ip_groups      = try(rule.value.source_ip_groups, null)
          destination_addresses = try(rule.value.destination_addresses, null)
          destination_ip_groups = try(rule.value.destination_ip_groups, null)
          destination_ports     = rule.value.destination_ports
          destination_fqdns     = try(rule.value.destination_fqdns, null)
          protocols             = rule.value.protocols
        }
      }
    }
  }

  dynamic "nat_rule_collection" {
    for_each = try(var.firewall_policy_rules.nat_rule_collections, {})

    content {
      name     = azurecaf_name.nat_rule[nat_rule_collection.key].result
      priority = nat_rule_collection.value.priority
      action   = nat_rule_collection.value.action

      dynamic "rule" {
        for_each = try(nat_rule_collection.value.rules, {})

        content {
          name                = rule.value.name
          source_addresses    = try(rule.value.source_addresses, null)
          source_ip_groups    = try(rule.value.source_ip_groups, null)
          destination_ports   = try(rule.value.destination_ports, null)
          destination_address = try(rule.value.destination_address, null)
          translated_port     = rule.value.translated_port
          translated_address  = rule.value.translated_address
          protocols           = rule.value.protocols
        }
      }
    }
  }

}