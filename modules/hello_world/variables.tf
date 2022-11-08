variable "prefix" {
  description = "Prefix of all resource names"
  type        = string
}


variable "enabled" {
  description = "Enable or disable lambda function"
  type        = bool
  default     = true
}
