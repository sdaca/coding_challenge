variable "prefix" {
  description = "Prefix of all resource names"
  type        = string
}

variable "trigger_rate" {
  description = "Rate [in minutes] in which the lambda function should be invoked"
  type        = number
  default     = 60
}

variable "enabled" {
  description = "Enable or disable lambda function"
  type        = bool
  default     = true
}
