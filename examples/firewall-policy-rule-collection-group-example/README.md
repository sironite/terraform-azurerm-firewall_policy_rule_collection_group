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

  network_rule_collections     = var.network_rule_collections
  application_rule_collections = var.application_rule_collections
  nat_rule_collections         = var.nat_rule_collections
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
