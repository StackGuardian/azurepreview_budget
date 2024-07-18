data "azurerm_subscription" "current" {}

resource "azurerm_monitor_action_group" "action_group" {
  name                = "test"
  resource_group_name = azurerm_subscription.current.name
  short_name          = "Cost_notification_alerts"
}

resource "azurerm_consumption_budget_subscription" "budget" {
  name            = var.name
  subscription_id = data.azurerm_subscription.current.id

  amount     = var.amount
  time_grain = var.time_grain

  time_period {
    start_date = formatdate("2024-07-01T00:00:00Z", timestamp())
  }

  notification {
    enabled   = true
    threshold = var.threshold
    operator  = var.operator
    threshold_type = var.threshold_type

    contact_emails = var.contact_emails
  }
}