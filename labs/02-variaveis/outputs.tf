output "url" {
  description = "Endereço da página"
  value       = "http://localhost:${var.porta_externa}"
}

output "nome_container" {
  description = "Nome do container criado"
  value       = docker_container.web.name
}