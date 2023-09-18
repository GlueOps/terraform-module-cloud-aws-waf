data "aws_acm_certificate" "amazon_issued" {
  for_each    = local.websites
  domain      = each.value.main_domain
  types       = ["AMAZON_ISSUED"]
  statuses    = ["ISSUED"]
  most_recent = true
}
