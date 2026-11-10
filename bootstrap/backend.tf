terraform {
  backend "s3" {
    bucket       = "rg-infralabs-terraform-state-345471468677"
    key          = "ecs-threat-composer/bootstrap/terraform.tfstate"
    region       = "eu-north-1"
    encrypt      = true
    use_lockfile = true
  }
}