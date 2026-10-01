data "aws_acm_certificate" "healthcare" {
  domain      = var.zone
  statuses    = ["ISSUED"]
  most_recent = true

  depends_on = [
    module.aws_load_balancer_controller
  ]
}
