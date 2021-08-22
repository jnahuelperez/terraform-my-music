# Spotify list built-in with Terraform

This repository stores a set of track lists that were built by using the [spotify-provider](https://registry.terraform.io/providers/conradludgate/spotify/latest).

Feel free to clone it and build yours!

## Requirements
- To have DEV's Spotify credentials
- TF state is stored on s3 remote backend. A pair of access/secrey key's will be required.
- An `.env` file with `SPOTIFY_CLIENT_ID` and `SPOTIFY_CLIENT_SECRET` id's.
- Docker installed to run API's endpoint with

## Steps
- Clone this repo
- Create a new TF file with the name list you want to build
- Create the resources needed and get the song's url to add it on `my-tracks` variable.
- Run Spotify API by using
```
docker run --rm -it -p 27228:27228 --env-file ./.env ghcr.io/conradludgate/spotify-auth-proxy
```
- Once running, browse `Auth URL` to enable tour APIKey
- Export it with `TF_VAR_spotify_api_key={API_KEY_VALUE_HERE}`
- `terraform apply -y`
- Enjoy
