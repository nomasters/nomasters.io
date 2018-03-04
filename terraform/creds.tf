resource "aws_iam_user" "circleci" {
  name = "circleci"
  path = "/"
  force_destroy = "true"
}

resource "aws_iam_policy" "manage_cdn_cache" {
  name        = "invalidate_cache_cloudfront"
  path        = "/"
  description = ""
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "cloudfront:CreateInvalidation"
            ],
            "Resource": "*"
        }
    ]
}
EOF

}


resource "aws_iam_policy" "write_to_site_bucket" {
  name        = "write_to_${var.site["bucket"]}_bucket"
  path        = "/"
  description = ""

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:GetObject",
                "s3:PutObject",
                "s3:GetObjectAcl",
                "s3:PutObjectAcl",
                "s3:ListBucket",
                "s3:GetBucketAcl",
                "s3:PutBucketAcl",
                "s3:GetBucketLocation"
            ],
            "Resource": "${aws_s3_bucket.site.arn}/*",
            "Condition": {}
        },
        {
            "Effect": "Allow",
            "Action": "s3:ListAllMyBuckets",
            "Resource": "*",
            "Condition": {}
        }
    ]
}
EOF
}

resource "aws_iam_policy" "write_to_killcord_site_bucket" {
  name        = "write_to_${data.aws_s3_bucket.killcord.id}_bucket"
  path        = "/"
  description = ""

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:GetObject",
                "s3:PutObject",
                "s3:GetObjectAcl",
                "s3:PutObjectAcl",
                "s3:ListBucket",
                "s3:GetBucketAcl",
                "s3:PutBucketAcl",
                "s3:GetBucketLocation"
            ],
            "Resource": "${data.aws_s3_bucket.killcord.arn}/*",
            "Condition": {}
        },
        {
            "Effect": "Allow",
            "Action": "s3:ListAllMyBuckets",
            "Resource": "*",
            "Condition": {}
        }
    ]
}
EOF
}

resource "aws_iam_policy_attachment" "circleci-cdn-cache" {
  name       = "manage_cdn_cache"
  users      = ["${aws_iam_user.circleci.name}"]
  policy_arn = "${aws_iam_policy.manage_cdn_cache.arn}"
}

resource "aws_iam_policy_attachment" "circleci" {
  name       = "allow_deploy_to_bucket"
  users      = ["${aws_iam_user.circleci.name}"]
  policy_arn = "${aws_iam_policy.write_to_site_bucket.arn}"
}

resource "aws_iam_policy_attachment" "circleci-killcord" {
  name       = "allow_deploy_to_killcord_bucket"
  users      = ["${aws_iam_user.circleci.name}"]
  policy_arn = "${aws_iam_policy.write_to_killcord_site_bucket.arn}"
}