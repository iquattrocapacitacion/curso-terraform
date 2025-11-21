variable "rg_name" {
  description = "Nombre del grupo de recursos"
  type        = string
  default     = "Recursos_Dalvinder_Salinas"
}

variable "ubicacion" {
  description = "Ubicación de mis recursos"
  type        = string
  default     = "East US"
}

variable "vnet_name" {
  description = "Nombre de la Red Virtual"
  type        = string
  default     = "vnet_dalvinder"
}

variable "subnet_prefix" {
  description = "Nombre de la subnet"
  type        = string
  default     = "subnet"
}

# variable "subnet_name_2" {
#   description = "Nombre de la subnet dos."
#   type        = string
# }

variable "segmento_vnet" {
  description = "Segmento principal de la vnet"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "segmento_subnets" {
  description = "Segmentos de las diferentes subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "subnet_names" {
  description = "Nombre de las sub redes"
  type        = list(string)
  default     = ["subnet-1", "subnet-2"]
}

variable "common_tags" {
  description = "Esto es un mapa de valores de cadenas"
  type        = map(string)
  default = {
    propietario      = "Dalvinder Salinas"
    desplegado_desde = "terraform"
  }
}

variable "numeros" {
  description = "Esto es una variable de números"
  type        = number
  default     = 42
}

variable "booleano" {
  description = "Esta es una variable de tipo Boleano"
  type        = bool
  default     = true
}

variable "lista_numero" {
  description = "Esto es una lista de números"
  type        = list(number)
  default     = [4, 6, 8, 20, 50]
}

variable "objeto" {
  description = "Esto es una variable de objetos"
  type = object({
    nombre                = string
    edad                  = number
    casado                = bool
    idioma                = list(string)
    contacto_de_confianza = map(string)
  })
  default = {
    nombre = "Dalvinder Salinas"
    edad   = 29
    casado = false
    idioma = ["Español", "Inglés"]
    contacto_de_confianza = {
      Madre = "78956012"
      Tia   = "78956012"
    }
  }
}

variable "tupla" {
  description = "Esto es una tupla"
  type        = tuple([string, number, bool])
  default     = ["Esto es una cadena", 11, true]
}
