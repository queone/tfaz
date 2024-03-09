# terraform {
#   required_version = ">= 1.7.4"

#   required_providers {
#     azurerm = {
#       source  = "hashicorp/azurerm"
#       version = "~> 3.28.0"
#     }
#   }

#   backend "azurerm" {
#     # Adjust below values according to your environment
#     resource_group_name  = "tfaz-resource-group-00"
#     storage_account_name = "tfaz-storage-account-00"
#     container_name       = "tfaz-container-00"
#     key                  = "tfaz.tfstate"
#   }
# }

# provider "azurerm" {
#   features {
#   }
# }

# providers.tf

terraform {
  required_version = ">= 1.7.3"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.92.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0.5"
    }
  }

  backend "azurerm" {
    resource_group_name  = "azuretf-rg00"
    storage_account_name = "azuretfsa00"
    container_name       = "tfaz-queone-ct02"
    key                  = "azuretf.tfstate"
    use_oidc             = true
  }
}

provider "azurerm" {
  skip_provider_registration = true
  # Above is only required when the User, Service Principal, or Identity running
  # Terraform lacks the permissions to register Azure Resource Providers.
  features {
  }
}
