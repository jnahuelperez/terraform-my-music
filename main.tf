terraform {
  required_providers {
    spotify = {
      source  = "conradludgate/spotify"
      version = "~> 0.2.0"
    }
  }

  backend "s3" {
    bucket = "elesel-public-stuff"
    key = "terraform/spotify"
    region = "us-east-1"
    profile = "elesel-prod"
  }
}

provider "aws" {
  region = var.region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

provider "spotify" {
  api_key = var.spotify_api_key
}

