# Example
This is an example of how to use the `tfaz-dns-zones` module. This examples pretends to be a Terraform module that manages the creation of Azure DNS zones for a specific organization's infrastructure.

1. First, make sure you setup the `providers.tf` file correctly, updating below values according to how you've setup the connections to your Azure environment: 
```hcl
  ...
  backend "azurerm" {
    # Adjust below 4 values according to your environment
    resource_group_name  = "tfaz-resource-group-00"
    storage_account_name = "tfaz-storage-account-00"       
    container_name       = "tfaz-container-00"
    key                  = "tfaz.tfstate"
    use_oidc             = true
  }
  ...
```

Review [Manage Azure With Terraform](https://que.tips/terraform/#manage-azure-with-terraform) for more info on this topic, and/or consult other sources.

2. Also make sure you setup the necessary local host environment variables, or Github Secret Environment variables, to be able to execute `terraform`.
```bash
export ARM_TENANT_ID="<azure_subscription_tenant_id>"
export ARM_CLIENT_ID="<service_principal_appid>"
export ARM_CLIENT_SECRET="<service_principal_password>"
export ARM_SUBSCRIPTION_ID="<azure_subscription_id>"
```

3. Next, populate `terraform.auto.tfvars` with the input variable entries you wish to test to create the desire DNS zone in Azure, along with all other subvariables. You can use the provided `terraform.auto.tfvars` file as a starting scaffold.

4. Now execute your `terraform` commands to initialize, validate, and/or apply the configuration:
```bash
terraform init
terraform plan
terraform apply
```
And that's it.
