terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

variable "sites" {
  type = map(object({
    porta    = number
    mensagem = string
  }))
  default = {
    blog = { porta = 8081, mensagem = "Bem-vindo ao blog" }
    loja = { porta = 8082, mensagem = "Bem-vindo à loja" }
    docs = { porta = 8083, mensagem = "Documentação" }
  }
}

module "site" {
  for_each = var.sites
  source   = "./modules/nginx-site"
  nome     = each.key
  porta    = each.value.porta
  mensagem = each.value.mensagem
}

moved {
  from = module.site_blog
  to   = module.site["blog"]
}

moved {
  from = module.site_loja
  to   = module.site["loja"]
}