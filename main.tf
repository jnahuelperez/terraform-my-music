terraform {
  required_providers {
    spotify = {
      source  = "conradludgate/spotify"
      version = "~> 0.2.0"
    }
  }
}

provider "spotify" {
  api_key = var.spotify_api_key
}

variable "spotify_api_key" {
  type = string
}