variable "app_name" {
  description = "Nombre base de la aplicación"
  type        = string
  default     = "servidor-web"

  validation {
    condition     = length(trimspace(var.app_name)) > 0
    error_message = "app_name no puede estar vacío."
  }
}

variable "group_id" {
  description = "Identificador del grupo (ej: grupo01)"
  type        = string
  default     = "grupo01"

  validation {
    condition     = can(regex("^[a-zA-Z0-9][a-zA-Z0-9_-]*$", var.group_id))
    error_message = "group_id debe comenzar con una letra o número y solo contener letras, números, guiones o guiones bajos."
  }
}

variable "environment" {
  description = "Ambiente de ejecución"
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "El ambiente debe ser 'dev', 'staging' o 'prod'."
  }
}

variable "host_port" {
  description = "Puerto expuesto en el host local"
  type        = number
  default     = 8080

  validation {
    condition     = var.host_port >= 1 && var.host_port <= 65535 && floor(var.host_port) == var.host_port
    error_message = "host_port debe ser un número entero entre 1 y 65535."
  }
}

variable "nginx_version" {
  description = "Etiqueta de versión de la imagen Nginx"
  type        = string
  default     = "1.27-alpine"

  validation {
    condition     = length(trimspace(var.nginx_version)) > 0
    error_message = "nginx_version no puede estar vacío."
  }
}
