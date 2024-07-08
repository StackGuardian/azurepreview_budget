resource "azurerm_cost_anomaly_alert" "cost_notification" {
  name            = "cost_notification"
  display_name    = "cost_notification"
  #subscription_id = "/subscriptions/00000000-0000-0000-0000-000000000000"
  email_subject   = "My Test Anomaly Alert"
  email_addresses = ["digbijayinee.clara@stackguardian.io","johannes.scheuerer@stackguardian.io"]
}