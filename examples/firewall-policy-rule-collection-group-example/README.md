# Terraform module | AzureRM - Firewall Policy Rule Collection Group

This Terraform module is designed to create a Firewall Policy Rule Collection Group for Azure.

## Pre-requisites

Using the modules requires the following pre-requisites:
 * Active Azure account and subscription 

## Usage

`InvFirewall Policy Rule Collection Groupullen`

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

## Authors

The module is maintained by [Sironite](https://github.com/sironite)

## Documentation

> product: https://azure.microsoft.com/en-us/
> 
> Provider: https://registry.terraform.io/providers/hashicorp/azurerm/latest
> 
> Documentation: https://learn.microsoft.com/en-us/azure/?product=popular
