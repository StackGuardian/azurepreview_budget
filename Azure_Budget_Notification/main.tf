data "azurerm_subscription" "current" {}

resource "azurerm_resource_group" "main" {
  name     = var.resourcename
  location = var.location
}

resource "azurerm_monitor_action_group" "action_group" {
  name                = var.action_group
  resource_group_name = azurerm_resource_group.main.name
  short_name          = "Notify-Action-Group"
}

resource "azurerm_consumption_budget_subscription" "budget" {
  name            = var.budgetname
  subscription_id = data.azurerm_subscription.current.id

  amount     = var.amount
  time_grain = var.time_grain

  time_period {
    start_date = var.start_date
  }

  notification {
    enabled   = true
    threshold = var.threshold
    operator  = var.operator
    threshold_type = var.threshold_type

     contact_groups = [
      azurerm_monitor_action_group.action_group.id,
     ]

  }
}