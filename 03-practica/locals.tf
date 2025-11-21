locals {
  common_tags = {
    project_name = var.project_name
    environment  = var.environment
    owner        = "Dalvinder"
    manage_by    = "Terraform"
  }
  prefix = "${var.project_name}-${var.environment}-${local.common_tags.owner}"
}
