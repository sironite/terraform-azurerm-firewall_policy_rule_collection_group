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

variable "network_rule_collections" {
  type = map(object({
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
  description = "A map of network rule collections to apply to the firewall policy."
  default     = {}
}

variable "application_rule_collections" {
  type = map(object({
    name     = string
    priority = number
    action   = string
    rules = map(object({
      name                  = string
      description           = optional(string)
      source_addresses      = optional(list(string))
      source_ip_groups      = optional(list(string))
      destination_addresses = optional(list(string))
      destination_urls      = optional(list(string))
      destination_fqdns     = optional(list(string))
      terminate_tls         = optional(bool)
      web_categories        = optional(list(string))
      protocols             = map(object({
        port = number
        type = string
      }))
    }))
  }))
  default = {}
  description = "A map of application rule collections to apply to the firewall policy."
}

variable "nat_rule_collections" {
  type = map(object({
    name                  = string
    action                = string
    priority              = number
    rules = map(object({
      name                  = string
      protocols              = string
      source_addresses      = optional(list(string))
      source_ip_groups      = optional(list(string))
      destination_address = optional(list(string))
      destination_ports     = optional(list(string))
      translated_address    = string
      translated_fqdn       = optional(string)
      translated_port       = optional(number)
    }))
  }))
  default = {}
  description = "A map of NAT rules to apply to the firewall policy."
}