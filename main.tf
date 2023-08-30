locals {
  websites = {
    customer2 = {
      main_domain = "venkatamutyala.com"
      cdn_aliases = ["test1.venkatamutyala.com"]
    }
    customer3 = {
      main_domain = "venkatamutyala.com"
      cdn_aliases = ["test2.venkatamutyala.com"]
    }
    customer4 = {
      main_domain = "venkatamutyala.com"
      cdn_aliases = ["test3.venkatamutyala.com"]
    }
    customer5 = {
      main_domain = "venkatamutyala.com"
      cdn_aliases = ["test4.venkatamutyala.com"]
    }
    customer6 = {
      main_domain = "venkatamutyala.com"
      cdn_aliases = ["test5.venkatamutyala.com"]
    }
    customer7 = {
      main_domain = "venkatamutyala.com"
      cdn_aliases = ["test6.venkatamutyala.com"]
    }
    customer8 = {
      main_domain = "venkatamutyala.com"
      cdn_aliases = ["test7.venkatamutyala.com"]
    }
    customer9 = {
      main_domain = "venkatamutyala.com"
      cdn_aliases = ["test11.venkatamutyala.com"]
    }
    customer10 = {
      main_domain = "venkatamutyala.com"
      cdn_aliases = ["test8.venkatamutyala.com"]
    }
    customer11 = {
      main_domain = "venkatamutyala.com"
      cdn_aliases = ["test9.venkatamutyala.com"]
    }
    customer12 = {
      main_domain = "venkatamutyala.com"
      cdn_aliases = ["test10.venkatamutyala.com"]
    }
  }
}

data "aws_acm_certificate" "amazon_issued" {
  for_each    = local.websites
  domain      = each.value.main_domain
  types       = ["AMAZON_ISSUED"]
  most_recent = true
}
