variable "rg_name" {
  description = "Este es el nombre del grupo de recursos."
  type        = string
  default     = "rg_terraform_Dalvinder"
}

variable "location" {
  description = "Lugar o Zona donde se desplegará mi infraestructura."
  type        = string
  default     = "East US"
}

variable "environment" {
  description = "Entorno en el que se trabajará."
  type        = string
  default     = "dev"
}

variable "project_name" {
  description = "Nombre del proyecto."
  type        = string
  default     = "TFCourse"
}

