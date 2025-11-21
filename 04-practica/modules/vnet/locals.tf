locals {
  common_tags = {
    Environment = var.environment
    Project     = var.project_name
    owner       = var.prefix_name
  }
}
