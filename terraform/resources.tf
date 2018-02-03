data "aws_acm_certificate" "site" {
  domain    = "${var.site["fqdn"]}"
}

data "aws_route53_zone" "site" {
  name = "${var.site["fqdn"]}"
}
