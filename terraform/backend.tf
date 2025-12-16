terraform {
  backend "s3" {
    bucket  = "tfstate-fiap-alex-academy-eks"
    key     = "tfstate"
    region  = "us-east-1"
    encrypt = false
  }
}
