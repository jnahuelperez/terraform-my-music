variable "spotify_api_key" {
  type = string
}

# -------- AWS Vars
variable "region" {
  type = string
  default = "us-east-1"
}

variable "aws_access_key" {
  type = string
}
variable "aws_secret_key" {
  type = string
}

variable "s3_bkt_name" {
  type = string
  default = "elesel-public-stuff"
}

variable "s3_bkt_path" {
  default = "terraform/spotify"
}