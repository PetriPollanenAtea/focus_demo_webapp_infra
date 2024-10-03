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
