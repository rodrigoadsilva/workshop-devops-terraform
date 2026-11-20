terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

locals {
  nome_completo = "${var.nome_container}-${var.ambiente}"
  pagina_html   = <<-EOT
    <h1>${var.mensagem}</h1>
    <p>Ambiente: ${var.ambiente}</p>
  EOT
}

resource "docker_image" "nginx" {
  name = "nginx:1.27"
}

resource "docker_container" "web" {
  name  = local.nome_completo
  image = docker_image.nginx.image_id

  ports {
    internal = 80
    external = var.porta_externa
  }

  upload {
    content = local.pagina_html
    file    = "/usr/share/nginx/html/index.html"
  }
}