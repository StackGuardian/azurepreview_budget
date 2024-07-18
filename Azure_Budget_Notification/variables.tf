variable "resourcename" {
  type = string
  description = "The name of the resource group. Must be unique on your Azure subscription"
  #default = "SG_Azure_Budget_Notifications"
}
variable "action_group" {
  type = string
  description = "The name of the action group."
  #default = "SG_Azure_Budget_Notifications"
}
variable "budgetname" {
  type = string
  description = "The name which should be used for this Subscription Consumption Budget."
  #default = "SG_Azure_Budget_Notifications"
}
variable "location" {
  type        = string
  description = "(Required) The location where the resource group should be created. For a list of all Azure locations, please consult this link or run az account list-locations --output table."
}
variable "amount" {
  type = number
  description = "The total amount of cost to track with the budget."
  default = 10
}
variable "threshold" {
  type = number
  description = "Threshold value associated with a notification. Notification is sent when the cost exceeded the threshold."
  default = 10
}
variable "threshold_type" {
  type = string
  description = "The type of threshold for the notification. This determines whether the notification is triggered by forecasted costs or actual costs."
  default = "Forecasted" # or "Actual"
}
variable "time_grain" {
  type =  string
  description = <<DESCRIPTION
  The time covered by a budget. Tracking of the amount will be reset based on the time grain.Must be one of the following
  - BillingAnnual
  - BillingMonth
  - BillingQuarter
  - Annually 
  - Monthly  
  - Quarterly.
  Defaults is set to Monthly.
  DESCRIPTION
  default = "Monthly"
}
variable "start_date" {
  type = string
  description = "The start date for the budget. The start date must be first of the month and should be less than the end date. Budget start date must be on or after June 1, 2017."
  default = "2024-07-01T00:00:00Z"
}
variable "operator" {
  type = string
  description = <<DESCRIPTION
  The comparison operator for the notification. Must be one of the following:
  - EqualTo
  - GreaterThan
  - GreaterThanOrEqualTo
  DESCRIPTION
  default = "GreaterThanOrEqualTo"
}