########
# terraform.tf variables
########
variable "subscription_id" {
  description = "Subscription ID"
  type = string
}

########
# main.tf variables
########
variable "location" {
  description = "Location of the environmnet"
  type = string
}

########
# static_web_app.tf variables
########
variable "name" {
  description = "Name to greet"
  type = string
}
