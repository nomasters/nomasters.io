resource "aws_s3_bucket" "site" {
    bucket = "${var.site["bucket"]}"
    acl = "public-read"
    versioning {
        enabled = true
    }
    tags {
        Name =  "${var.site["name"]}"
        Environment = "${var.site["environment"]}"
        Project = "${var.site["project"]}"
    }
}