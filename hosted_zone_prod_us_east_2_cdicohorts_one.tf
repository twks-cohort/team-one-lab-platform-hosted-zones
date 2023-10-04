# *.prod_us_east_2.cdicohorts.one

# define a provider in the account where this subdomain will be managed
provider "aws" {
  alias  = "subdomain_prod_us_east_2_cdicohorts_one"
  region = "us-east-2"
  assume_role {
    role_arn     = "arn:aws:iam::${var.nonprod_account_id}:role/${var.assume_role}"
    session_name = "tone-lab-platform-hosted-zones"
  }
}

# create a route53 hosted zone for the subdomain in the account defined by the provider above
module "subdomain_prod_us_east_2_cdicohorts_one" {
  source  = "terraform-aws-modules/route53/aws//modules/zones"
  version = "2.0.0"
  create  = true

  providers = {
    aws = aws.subdomain_prod_us_east_2_cdicohorts_one
  }

  zones = {
    "prod-us-east-2.${local.domain_cdicohorts_one}" = {
      tags = {
        cluster = "nonprod"
      }
    }
  }

  tags = {
    pipeline = "tone-lab-platform-hosted-zones"
  }
}

# Create a zone delegation in the top level domain for this subdomain
module "subdomain_zone_delegation_prod_us_east_2_cdicohorts_one" {
  source  = "terraform-aws-modules/route53/aws//modules/records"
  version = "2.0.0"
  create  = true

  providers = {
    aws = aws.subdomain_prod_us_east_2_cdicohorts_one
  }

  private_zone = false
  zone_name = local.domain_cdicohorts_one
  records = [
    {
      name            = "prod"
      type            = "NS"
      ttl             = 172800
      zone_id         = data.aws_route53_zone.zone_id_cdicohorts_one.id
      allow_overwrite = true
      records         = lookup(module.subdomain_prod_us_east_2_cdicohorts_one.route53_zone_name_servers,"prod-us-east-2.${local.domain_cdicohorts_one}")
    }
  ]

  depends_on = [module.subdomain_prod_us_east_2_cdicohorts_one]
}
