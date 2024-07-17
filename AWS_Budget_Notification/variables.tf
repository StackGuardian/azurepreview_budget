variable "name" {
  type = string
  description = "Name of the budget resource"
}
variable "amount" {
  type = string
  description = "Total amount of budget in dollars"
}
variable "region" {
  type = string
  description = "AWS Region where the resource gets deployed"
}

variable "threshold" {
  type = number
  default = 100
  description = "Threshold in % when the notification should be triggered"
}
variable "threshold_type" {
  type = string
  default = "FORECASTED" # or "ACTUAL"
  description = "Is the notification sent out on actual or forecasted consumption"
}
variable "emails" {
  type = list
  description = "List of emails the notification should be sent out to"
}