data "aws_route53_zone" "internal" {
  name         = "lab.picpay.internal."
  private_zone = true
}

module "hostname" {
  source = "../../../../../../module-terraform-route53-records"

  zone_id     = data.aws_route53_zone.internal.zone_id
  type        = "A"
  records     = ["8.8.8.8"]
  name        = "foo"
  squad       = "infracore"
  environment = "lab"
  costcenter  = "1100"
  tribe       = "Infra Cloud"
  application = "docker"

}
