resource "aws_route53_zone" "main" {
  name = "${var.domain}"
}

resource "aws_route53_record" "app" {
  zone_id = "${aws_route53_zone.main.zone_id}"
  name    = "app.${var.domain}"
  type    = "A"

  alias {
    name                   = "${aws_alb.main.dns_name}"
    zone_id                = "${aws_alb.main.zone_id}"
    evaluate_target_health = true
  }
}
