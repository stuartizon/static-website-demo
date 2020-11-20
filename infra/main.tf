terraform {
  required_version = "~> 0.13.0"
}

provider "aws" {
  version = "~> 2.0"
  region  = "ap-southeast-1"
}

data "aws_route53_zone" "root" {
  name = var.domain_name
}

module "website" {
  source      = "stuartizon/static-website/aws"
  version     = "0.1.4"
  domain_name = "www.${var.domain_name}"
  redirects   = [var.domain_name]
  zone_id     = data.aws_route53_zone.root.id
}
