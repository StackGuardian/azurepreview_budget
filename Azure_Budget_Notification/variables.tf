variable "name" {
  type = string
  default = "SG_Azure_Budget_Notifications"
}
variable "amount" {
  type = number
  default = 20
}
variable "threshold" {
  type = number
  default = 20
}
variable "threshold_type" {
  type = string
  default = "Forecasted" # or "ACTUAL"
}
variable "emails" {
  type = list
  default = " "
}