data "azurerm_subscription" "current" {}

resource "azurerm_resource_group" "resourceGroup" {
  name     = "resourceGroup"
  location = "eastus"
}

resource "azurerm_monitor_action_group" "action_group" {
  name                = "action_group"
  resource_group_name = azurerm_resource_group.resourceGroup.name
  short_name          = "action_group"
}

resource "azurerm_consumption_budget_subscription" "budget" {
  name            = var.name
  subscription_id = data.azurerm_subscription.current.id

  amount     = var.amount
  time_grain = var.time_grain

  time_period {
    start_date = formatdate("2024-07-0100:00:00Z", timestamp())
  }

  notification {
    enabled   = true
    threshold = var.threshold
    operator  = var.operator
    threshold_type = var.threshold_type

     contact_groups = [
      azurerm_monitor_action_group.action_group.id,
     ]

    #contact_emails = var.contact_emails
  }
}