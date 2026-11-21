output "urls" {
  value = { for nome, site in module.site : nome => site.url }
}