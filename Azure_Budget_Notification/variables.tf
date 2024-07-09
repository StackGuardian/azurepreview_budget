variable "total_limit" {
  type = string
  description = "Total amount of budget in dollars"
}
variable "region" {
  type = string
}

variable "notification_threshold" {
  type = number
  default = 50
}
variable "threshold_type" {
  type = string
  default = "Forecasted" # or "ACTUAL"
}
variable "emails" {
  type = list
}