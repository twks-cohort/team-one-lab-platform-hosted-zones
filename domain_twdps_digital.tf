locals {
  domain_twdps_digital = "twdps.digital"
}

provider "aws" {
  alias  = "domain_twdps_digital"
  region = "us-east-2"
  assume_role {
    role_arn = "arn:aws:iam::${var.nonprod_account_id}:role/${var.assume_role}"
  }
}

# zone id for the top-level-zone
data "aws_route53_zone" "zone_id_twdps_digital" {
  provider = aws.domain_twdps_digital
  name     = local.domain_twdps_digital
}
