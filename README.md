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
| firewall\_policy\_rules | A map of firewall policy rules to apply to the rule collection group. | <pre>map(object({<br>    enabled  = bool<br>    priority = number<br>    application_rule_collections = map(object({<br>      name     = string<br>      priority = number<br>      action   = string<br>      rules = map(object({<br>        name                  = string<br>        source_addresses      = optional(list(string))<br>        source_ip_groups      = optional(list(string))<br>        destination_fqdn_tags = optional(list(string))<br>        destination_fqdns     = optional(list(string))<br>        protocols = list(object({<br>          type = optional(string)<br>          port = optional(number)<br>        }))<br>      }))<br>    }))<br>    network_rule_collections = map(object({<br>      name     = string<br>      priority = number<br>      action   = string<br>      rules = map(object({<br>        name                  = string<br>        source_addresses      = optional(list(string))<br>        source_ip_groups      = optional(list(string))<br>        destination_addresses = optional(list(string))<br>        destination_ip_groups = optional(list(string))<br>        destination_ports     = list(string)<br>        destination_fqdns     = optional(list(string))<br>        protocols             = list(string)<br>      }))<br>    }))<br>    nat_rule_collections = map(object({<br>      priority = number<br>      action   = string<br>      rules = map(object({<br>        name                = string<br>        source_addresses    = optional(list(string))<br>        source_ip_groups    = optional(list(string))<br>        destination_ports   = optional(list(string))<br>        destination_address = string<br>        translated_port     = number<br>        translated_address  = string<br>        protocols           = list(string)<br>      }))<br>    }))<br>  }))</pre> | yes |
| priority | The priority of the rule collection group. | `number` | yes |

## Outputs

| Name | Description |
|------|-------------|
| collection\_group\_id | n/a |
| collection\_group\_name | n/a |

## Related documentation
<!-- END_TF_DOCS -->