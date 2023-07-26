<!-- BEGIN_TF_DOCS -->
 ## Firewall Policy Rule Collection Group
[![Changelog](https://img.shields.io/badge/changelog-release-green.svg)](https://github.com/sironite/terraform-azurerm-firewall_policy_rule_collection_group/releases/latest) [![Notice](https://img.shields.io/badge/notice-copyright-yellow.svg)](NOTICE) [![Apache V2 License](https://img.shields.io/badge/license-Apache%20V2-orange.svg)](LICENSE) [![TF Registry](https://img.shields.io/badge/terraform-registry-blue.svg)](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/firewall_policy_rule_collection_group)

# Usage - Module

##  Firewall Policy Rule Collection Group

```hcl
module "firewall_policy_rule_collection_group" {
  source  = "sironite/firewall_policy_rule_collection_group/azurerm"
  version = "X.X.X"

  collection_group_name = "example"
  firewall_policy_id    = azurerm_firewall_policy.this.id
  priority              = 100

  network_rule_collections     = var.network_rule_collections
  application_rule_collections = var.application_rule_collections
  nat_rule_collections         = var.nat_rule_collections
}
```


## Providers

| Name | Version |
|------|---------|
| azurerm | >=2.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_firewall_policy_rule_collection_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/firewall_policy_rule_collection_group) | resource |

## Inputs

| Name | Description | Type | Required |
|------|-------------|------|:--------:|
| collection\_group\_name | The name of the firewall policy rule collection group. | `string` | yes |
| firewall\_policy\_id | The ID of the firewall policy to associate the rule collection group with. | `string` | yes |
| priority | The priority of the rule collection group. | `number` | yes |
| application\_rule\_collections | A map of application rule collections to apply to the firewall policy. | <pre>map(object({<br>    name     = string<br>    priority = number<br>    action   = string<br>    rules = map(object({<br>      name                  = string<br>      description           = optional(string)<br>      source_addresses      = optional(list(string))<br>      source_ip_groups      = optional(list(string))<br>      destination_addresses = optional(list(string))<br>      destination_urls      = optional(list(string))<br>      destination_fqdns     = optional(list(string))<br>      terminate_tls         = optional(bool)<br>      web_categories        = optional(list(string))<br>      protocols             = map(object({<br>        port = number<br>        type = string<br>      }))<br>    }))<br>  }))</pre> | no |
| nat\_rule\_collections | A map of NAT rules to apply to the firewall policy. | <pre>map(object({<br>    name                  = string<br>    action                = string<br>    priority              = number<br>    rules = map(object({<br>      name                  = string<br>      protocols              = string<br>      source_addresses      = optional(list(string))<br>      source_ip_groups      = optional(list(string))<br>      destination_address = optional(list(string))<br>      destination_ports     = optional(list(string))<br>      translated_address    = string<br>      translated_fqdn       = optional(string)<br>      translated_port       = optional(number)<br>    }))<br>  }))</pre> | no |
| network\_rule\_collections | A map of network rule collections to apply to the firewall policy. | <pre>map(object({<br>    name     = string<br>    priority = number<br>    action   = string<br>    rules = map(object({<br>      name                  = string<br>      source_addresses      = optional(list(string))<br>      source_ip_groups      = optional(list(string))<br>      destination_addresses = optional(list(string))<br>      destination_ip_groups = optional(list(string))<br>      destination_ports     = list(string)<br>      destination_fqdns     = optional(list(string))<br>      protocols             = list(string)<br>    }))<br>  }))</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| collection\_group\_id | n/a |
| collection\_group\_name | n/a |

## Related documentation
<!-- END_TF_DOCS -->