# Network Module

This module provisions a resource group, virtual network, and subnets for the CST8918 project in Canada Central.

## Inputs
- `location`: Azure region (default: `Canada Central`).
- `group_number`: Your group number from Brightspace.

## Outputs
- `resource_group_name`: Name of the resource group.
- `vnet_name`: Name of the virtual network.
- `subnet_ids`: Map of subnet IDs (prod, test, dev, admin).