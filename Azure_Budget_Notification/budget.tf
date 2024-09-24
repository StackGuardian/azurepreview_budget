data "azurerm_subscription" "current" {}

resource "azurerm_consumption_budget_subscription" "budget" {
  name            = var.name
  subscription_id = data.azurerm_subscription.current.id

  amount     = var.amount
  time_grain = var.time_grain

 
   time_period {
   start_date = formatdate("YYYY-MM-01'T'00:00:00Z", timestamp())
   #end_date = var.end_date
 }

  notification {
    enabled   = true
    threshold = var.threshold
    operator  = var.operator
    threshold_type = var.threshold_type

     contact_emails = var.emails

  }
}
