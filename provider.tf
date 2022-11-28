# Configure the AWS Provider
provider "aws" {
  region              = var.region
  allowed_account_ids = var.allowed_account_ids

  default_tags {
    tags = var.tags
  }
}

provider "aws" {
  alias  = "withoutProviderTags"
  region = var.region
}