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

variable "github_token" {
  description = "GitHub Personal Access Token for WebApp source control configuration"
  type = string
}