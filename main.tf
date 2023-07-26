resource "azurerm_firewall_policy_rule_collection_group" "this" {
  name               = var.collection_group_name
  firewall_policy_id = var.firewall_policy_id
  priority           = var.priority

  dynamic "application_rule_collection" {
    for_each = var.application_rule_collections != null ? var.application_rule_collections : {}

    content {
      name = application_rule_collection.value.name
      priority = application_rule_collection.value.priority
      action = application_rule_collection.value.action

    dynamic "rule" {
      for_each = application_rule_collection.value.rules != null ? application_rule_collection.value.rules : {}

      content {
        name = rule.value.name
        description = try(rule.value.description, null)
        source_addresses = try(rule.value.source_addresses, null)
        source_ip_groups = try(rule.value.source_ip_groups, null)
        destination_addresses = try(rule.value.destination_addresses, null)
        destination_urls = try(rule.value.destination_urls, null)
        destination_fqdns = try(rule.value.destination_fqdns, null)
        terminate_tls = try(rule.value.terminate_tls, null)
        web_categories = try(rule.value.web_categories, null)

        dynamic "protocols" {
          for_each = rule.value.protocols != null ? rule.value.protocols : {}

          content {
            port = protocols.value.port
            type = protocols.value.type
          }
        }
      }  
    }
    }
  }

  dynamic "network_rule_collection" {
    for_each = var.network_rule_collections != null ? var.network_rule_collections : {}

    content {
      name     = network_rule_collection.value.name
      priority = network_rule_collection.value.priority
      action   = network_rule_collection.value.action

      dynamic "rule" {
        for_each = network_rule_collection.value.rules != null ? network_rule_collection.value.rules : {}

        content {
          name                  = rule.value.name
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
    for_each = var.nat_rule_collections != null ? var.nat_rule_collections : {}

    content {
      name = nat_rule_collection.value.name
      action = nat_rule_collection.value.action
      priority = nat_rule_collection.value.priority

      dynamic "rule" {
        for_each = var.nat_rule_collections.value.rules != null ? var.nat_rule_collections.value.rules : {}

        content {
          name = rule.value.name
          protocols = rule.value.protocols
          source_addresses = try(rule.value.source_addresses, null)
          source_ip_groups = try(rule.value.source_ip_groups, null)
          destination_address = try(rule.value.destination_address, null)
          destination_ports =try(rule.value.destination_ports, null)
          translated_address = rule.value.translated_address
          translated_fqdn = try(rule.value.translated_fqdn, null)
          translated_port = try(rule.value.translated_port, null)
        }
        
      }
    }
    
  }

}