terraform {
  required_version = ">= 1.7.4"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.28.0"
    }
  }

  backend "azurerm" {
    # Adjust below values according to your environment
    resource_group_name  = "tfaz-resource-group-00"
    storage_account_name = "tfaz-storage-account-00"
    container_name       = "tfaz-container-00"
    key                  = "tfaz.tfstate"
  }
}

provider "azurerm" {
  features {
  }
}
