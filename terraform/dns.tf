resource "aws_route53_record" "nomasters_io_ipv4" {
  zone_id = "${data.aws_route53_zone.site.zone_id}"
  name = "${var.site["bucket"]}"
  type = "A"
  alias {
    name = "${aws_cloudfront_distribution.site.domain_name}"
    zone_id = "${aws_cloudfront_distribution.site.hosted_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "nomasters_io_ipv6" {
  zone_id = "${data.aws_route53_zone.site.zone_id}"
  name = "${var.site["bucket"]}"
  type = "AAAA"
  alias {
    name = "${aws_cloudfront_distribution.site.domain_name}"
    zone_id = "${aws_cloudfront_distribution.site.hosted_zone_id}"
    evaluate_target_health = false
  }
}