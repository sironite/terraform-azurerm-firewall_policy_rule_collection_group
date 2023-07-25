# Specify the required version of Terraform
terraform {
  required_version = ">= 1.0.0"

  # Specify the required version of the azurerm provider
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=2.0.0"
    }
  }
}