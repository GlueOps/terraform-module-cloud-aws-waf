
module "cdn" {
  for_each               = local.websites
  source                 = "git::https://github.com/cloudposse/terraform-aws-cloudfront-cdn?ref=1.0.0"
  acm_certificate_arn    = data.aws_acm_certificate.amazon_issued[each.key].arn
  aliases                = each.value.cdn_aliases
  origin_domain_name     = "venkata-demo.apps.nonprod.antoniostacos.onglueops.com"
  dns_aliases_enabled    = false
  name                   = each.key
  price_class            = "PriceClass_100"
  forward_headers        = ["*"]
  forward_query_string   = true
  forward_cookies        = "all"
  default_ttl            = 0
  logging_enabled        = false
  viewer_protocol_policy = "allow-all"
  web_acl_id             = aws_wafv2_web_acl.primary.arn
}
