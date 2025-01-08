# Define the provider
provider "aws" {
  region = var.aws_region
  default_tags {
    tags = var.global_tags
  }
}

# TF state bucket
terraform {
  backend "s3" {
    bucket = "my-tfstate-bucket-001" # Replace with your S3 bucket name
    key    = "terraform-database.tfstate"
    region = "eu-west-1"             # Replace with your AWS region
  }
}

# Timestream Database
resource "aws_timestreamwrite_database" "timestream_database" {
  database_name = var.timestream_database_name
}

# Timestream Table
resource "aws_timestreamwrite_table" "timestream_table" {
  database_name = aws_timestreamwrite_database.timestream_database.database_name
  table_name    = var.timestream_table_name

  retention_properties {
    magnetic_store_retention_period_in_days = var.magnetic_retention_days
    memory_store_retention_period_in_hours = var.memory_retention_hours
  }
}

# Output the Timestream database and table details
output "timestream_database_name" {
  description = "The name of the Timestream database"
  value       = aws_timestreamwrite_database.timestream_database.database_name
}

output "timestream_table_name" {
  description = "The name of the Timestream table"
  value       = aws_timestreamwrite_table.timestream_table.table_name
}
