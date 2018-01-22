This is the repo for [nomasters.io](https://nomasters.io)

Included are:

- the [terraform](https://www.terraform.io/) template for created the s3, route53, and cloudfront configurations as well as a low-privilage IAM account for circleci
- the [circleCI](https://circleci.com/) config for automatically deploying the blog when code is pushed to `origin/master`
- a `/scripts` folder for simplifying the deployment process (can be run locally or automatically with `circleci`)