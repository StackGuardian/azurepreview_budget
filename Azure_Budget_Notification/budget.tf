data "azurerm_subscription" "current" {}

resource "azurerm_consumption_budget_subscription" "budget" {
  name            = "budget"
  subscription_id = data.azurerm_subscription.current.id

  amount     = 50
  time_grain = "Monthly"

  time_period {
    start_date = "2024-07-01T00:00:00Z"
  }

  notification {
    enabled   = true
    threshold = var.notification_threshold
    operator  = "GreaterThan"

    contact_emails = [
      "digbijayinee.clara@stackguardian.io",
      "johannes.scheuerer@stackguardian.io",
    ]
  }

  notification {
    enabled        = false
    threshold      = var.notification_threshold
    operator       = "GreaterThan"
    threshold_type = var.threshold_type

    contact_emails = var.emails
  }
}