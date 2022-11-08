variable "prefix" {
  description = "Prefix of all resource names"
  type        = string
}

variable "schedule_expression" {
  description = "The scheduling expression. For example, cron(0 20 * * ? *) or rate(5 minutes)"
  type        = string
  default     = "cron(0 * * * ? *)"
}

variable "enabled" {
  description = "Enable or disable lambda function"
  type        = bool
  default     = true
}
