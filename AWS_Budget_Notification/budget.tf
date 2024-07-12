resource "aws_budgets_budget" "total" {
  name              = var.name
  budget_type       = "COST"
  limit_amount      = var.amount
  limit_unit        = "USD"
  time_period_end   = "2087-06-15_00:00"
  time_period_start = "2017-07-01_00:00"
  time_unit         = "MONTHLY"

  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = var.threshold
    threshold_type             = "PERCENTAGE"
    notification_type          = var.threshold_type
    subscriber_email_addresses = var.emails
  }
}