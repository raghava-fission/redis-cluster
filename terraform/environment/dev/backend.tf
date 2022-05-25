terraform {
  backend "s3" {
    bucket = "terraform-status-bkt"
    key    = "dev/redis/terraform.tfstate"
    region = "ap-south-1"
  }
}