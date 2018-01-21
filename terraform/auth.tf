provider "aws" {
  access_key = "${var.nomasters_site_aws_access_key}"
  secret_key = "${var.nomasters_site_aws_secret_key}"
  region     = "us-east-1"
}