variable "nomasters_site_aws_access_key" {}
variable "nomasters_site_aws_secret_key" {}

variable "site" {
  type = "map"
  default = {
    fqdn = "nomasters.io"
    bucket = "nomasters.io"
    name = "nomasters"
    environment = "prod"
    project = "nomasters"
    root_object = "index.html"
  }
}