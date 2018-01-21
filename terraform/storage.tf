resource "aws_s3_bucket" "site" {
    bucket = "${var.site["bucket"]}"
    acl = "public-read"
    versioning {
        enabled = true
    }

    website {
        index_document = "index.html"
        error_document = "404.html"

    }

    tags {
        Name =  "${var.site["name"]}"
        Environment = "${var.site["environment"]}"
        Project = "${var.site["project"]}"
    }
}