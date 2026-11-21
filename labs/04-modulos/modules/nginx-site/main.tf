resource "docker_image" "nginx" {
  name         = var.imagem
  keep_locally = true
}

resource "docker_container" "site" {
  name  = var.nome
  image = docker_image.nginx.image_id

  ports {
    internal = 80
    external = var.porta
  }

  upload {
    content = "<meta charset=\"utf-8\"><h1>${var.mensagem}</h1><p>Site: ${var.nome}</p>"
    file    = "/usr/share/nginx/html/index.html"
  }
}