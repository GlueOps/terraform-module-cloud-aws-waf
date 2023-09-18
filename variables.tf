
variable "websites" {
  description = "Customer sites"
  type = map(object({
    main_domain        = string
    additional_domains = list(string)
  }))
}

variable "origin_domain_name" {
  description = "Domain to the origin server"
  type        = string
}
