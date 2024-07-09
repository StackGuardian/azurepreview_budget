data "azurerm_subscription" "current" {}

resource "azurerm_consumption_budget_subscription" "budget" {
  name            = var.name
  subscription_id = data.azurerm_subscription.current.id

  amount     = var.amount
  time_grain = "Monthly"

  time_period {
    start_date = "2024-07-01T00:00:00Z"
  }

  notification {
    enabled   = true
    threshold = var.threshold
    operator  = "GreaterThan"
    threshold_type = var.threshold_type

    contact_emails = var.contact_emails
  }
}