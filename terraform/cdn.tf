resource "aws_cloudfront_distribution" "site" {
  origin {
    domain_name = "${var.site["bucket"]}.s3.amazonaws.com"
    origin_id   = "S3-${var.site["bucket"]}"
  }
  enabled             = true
  is_ipv6_enabled     = true
  comment             = "${var.site["name"]}"
  default_root_object = "${var.site["root_object"]}"

  aliases = ["${var.site["fqdn"]}"]

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "S3-${var.site["bucket"]}"
    compress = true
    viewer_protocol_policy = "redirect-to-https"
    min_ttl = "0"
    default_ttl = "86400"
    max_ttl = "31536000"
    
    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }
  }

  tags {
    Name        = "${var.site["name"]}"
    Environment = "${var.site["environment"]}"
    Project     = "${var.site["project"]}"
  }

  custom_error_response {
    error_caching_min_ttl = "60"
    error_code = "404"
    response_code = "404"
    response_page_path = "/404.html"
  }

  viewer_certificate {
    ssl_support_method = "sni-only"
    cloudfront_default_certificate = "false"
    minimum_protocol_version = "TLSv1.2_2018"
    acm_certificate_arn = "${data.aws_acm_certificate.site.arn}"
  }
  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
}