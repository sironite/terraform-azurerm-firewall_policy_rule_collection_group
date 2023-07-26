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