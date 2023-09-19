module "cdn" {
  for_each               = var.websites
  source                 = "git::https://github.com/cloudposse/terraform-aws-cloudfront-cdn?ref=1.0.0"
  acm_certificate_arn    = data.aws_acm_certificate.amazon_issued[each.key].arn
  aliases                = each.value.additional_domains
  origin_domain_name     = var.origin_domain_name
  dns_aliases_enabled    = false
  name                   = each.key
  price_class            = "PriceClass_100"
  forward_headers        = ["*"]
  forward_query_string   = true
  forward_cookies        = "all"
  default_ttl            = 0
  logging_enabled        = false
  viewer_protocol_policy = "allow-all"
  web_acl_id             = var.waf_web_acl_arn
}
