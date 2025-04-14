# Backend Module

This module provisions an Azure Blob Storage account to store Terraform state files.

## Inputs
- `location`: Azure region (default: `East US`).
- `group_number`: Your group number from Brightspace.

## Outputs
- `storage_account_name`: Name of the storage account.
- `container_name`: Name of the storage container.
- `resource_group_name`: Name of the resource group.