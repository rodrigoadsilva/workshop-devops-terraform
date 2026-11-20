variable "nome_container" {
  description = "Nome base do container Nginx"
  type        = string
  default     = "nginx-lab2"
}

variable "porta_externa" {
  description = "Porta exposta no Codespace"
  type        = number
  default     = 8080

  validation {
    condition     = var.porta_externa >= 1024 && var.porta_externa <= 65535
    error_message = "A porta deve estar entre 1024 e 65535."
  }
}

variable "ambiente" {
  description = "Nome do ambiente"
  type        = string
  default     = "dev"
}

variable "mensagem" {
  description = "Mensagem exibida na página"
  type        = string
}