resource "azurepreview_budget" "total" {
  name       = "total_budget"
  scope      = "subscriptions/a97621d8-9158-4681-81b6-38b1222afba4"
  category   = "Cost"
  amount     = 50
  time_grain = "Monthly"

  time_period {
    start_date = "2017-06-01T00:00:00Z"
    end_date   = "2035-06-01T00:00:00Z"
  }

  notification {
    name      = "notify-emails"
    operator  = "GreaterThanOrEqualTo"
    threshold = 80
    contact_emails = [
      "digbijayinee.clara@stackguardian.io",
      "johannes.scheuerer@stackguardian.io"
    ]
  }
}