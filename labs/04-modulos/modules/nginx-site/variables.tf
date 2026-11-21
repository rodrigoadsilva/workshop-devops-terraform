variable "nome" {
  description = "Nome do site e do container"
  type        = string
}

variable "porta" {
  description = "Porta externa do site"
  type        = number
}

variable "mensagem" {
  description = "Mensagem exibida na página"
  type        = string
}

variable "imagem" {
  description = "Imagem do Nginx"
  type        = string
  default     = "nginx:1.27"
}