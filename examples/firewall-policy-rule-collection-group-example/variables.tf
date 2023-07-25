variable "collection_group_name" {
  type        = string
  description = "The name of the firewall policy rule collection group."
}

variable "firewall_policy_id" {
  type        = string
  description = "The ID of the firewall policy to associate the rule collection group with."
}

variable "priority" {
  type        = number
  description = "The priority of the rule collection group."
}

variable "firewall_policy_rules" {
  description = "A map of firewall policy rules to apply to the rule collection group."
  type = map(object({
    enabled  = bool
    priority = number
    application_rule_collections = map(object({
      name     = string
      priority = number
      action   = string
      rules = map(object({
        name                  = string
        source_addresses      = optional(list(string))
        source_ip_groups      = optional(list(string))
        destination_fqdn_tags = optional(list(string))
        destination_fqdns     = optional(list(string))
        protocols = list(object({
          type = optional(string)
          port = optional(number)
        }))
      }))
    }))
    network_rule_collections = map(object({
      name     = string
      priority = number
      action   = string
      rules = map(object({
        name                  = string
        source_addresses      = optional(list(string))
        source_ip_groups      = optional(list(string))
        destination_addresses = optional(list(string))
        destination_ip_groups = optional(list(string))
        destination_ports     = list(string)
        destination_fqdns     = optional(list(string))
        protocols             = list(string)
      }))
    }))
    nat_rule_collections = map(object({
      priority = number
      action   = string
      rules = map(object({
        name                = string
        source_addresses    = optional(list(string))
        source_ip_groups    = optional(list(string))
        destination_ports   = optional(list(string))
        destination_address = string
        translated_port     = number
        translated_address  = string
        protocols           = list(string)
      }))
    }))
  }))
}