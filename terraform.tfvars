region          = "ap-southeast-1"
master_prefix   = "kn"
env_prefix      = "lab"
app_prefix      = "argocd"

allowed_account_ids = [
  "771330335857"
]

tags = {
    "support-team": "devops-team"
    "terraform": true
    "cost-center": "100001"
    "cost-pool": "100001"
    "project-id": "argocd"
    "data-classification": "internal"
    "system-tier-classification": "tier-2"
    "application": "argocd"
    "application-id": "argocd"
    "environment": "lab"
    "owner-tech": "kennguyen140517@gmail.com"
    "primary-contact": "kennguyen140517@gmail.com"
    "pl-code": "1000002"
}

vpc_cidr                = "10.34.0.0/16"
subnet_prefix_extension = 4
zone_offset             = 8