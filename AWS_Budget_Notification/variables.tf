variable "name" {
  type = string
  description = "Name of the budget resource"
  default = "SG-AWS-Budgets"
}
variable "amount" {
  type = number
  description = "Total amount of budget in dollars"
  default = 100
}
variable "region" {
  type = string
  description = "AWS Region where the resource gets deployed"
  default = "eu-central-1"
}

variable "threshold" {
  type = number
  default = 100
  description = "Threshold in % when the notification should be triggered"
}
variable "notification_type" {
  type = string
  default = "FORECASTED" # or "ACTUAL"
  description = "Is the notification sent out on actual or forecasted consumption"
}
variable "emails" {
  type = list
  description = "List of emails the notification should be sent out to"
  default = ["test@mail.com"]
}
variable "threshold_type" {
  type = string
  description = "What kind of threshold is defined. Can be PERCENTAGE OR ABSOLUTE_VALUE."
  default = "PERCENTAGE"
}
variable "comparison_operator" {
  type = string
  description = "Comparison operator to use to evaluate the condition. Can be LESS_THAN, EQUAL_TO or GREATER_THAN"
  default = "GREATER_THAN"
}