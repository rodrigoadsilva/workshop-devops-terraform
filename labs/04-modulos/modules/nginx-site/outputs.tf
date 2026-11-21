output "url" {
  description = "Endereço do site"
  value       = "http://localhost:${var.porta}"
}

output "nome" {
  description = "Nome do container"
  value       = docker_container.site.name
}