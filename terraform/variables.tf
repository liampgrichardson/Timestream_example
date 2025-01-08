# AWS Region
variable "aws_region" {
  description = "The AWS region to deploy resources in, gotten from gh actions"
  type        = string
}

# Global tags
variable "global_tags" {
  description = "A map of global tags to apply to all resources"
  type        = map(string)
}

variable "timestream_database_name" {
  description = "The name of the Timestream database"
  type        = string
}

variable "timestream_table_name" {
  description = "The name of the Timestream table"
  type        = string
}

variable "memory_retention_hours" {
  description = "Retention period in hours for memory store"
  type        = number
}

variable "magnetic_retention_days" {
  description = "Retention period in days for magnetic store"
  type        = number
}
