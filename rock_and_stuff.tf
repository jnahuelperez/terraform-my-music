resource "spotify_playlist" "rockandstuff" {
  name        = "Rock and Stuff"
  description = "This list has been built with terraform because why not?"
  public      = false

  tracks = flatten([
    data.spotify_track.songs[*].id
  ])
}

variable "my-tracks" {
  type = list(string)
  default = [
      "https://open.spotify.com/track/2VGQ342iuqj6aSaYbyBQVJ?si=444dd83a64e84a72",
      "https://open.spotify.com/track/0R0Od004mm1yRHEVnpygoj?si=255b8231373d424b",
      "https://open.spotify.com/track/22klU94r0NFtx4cPO8KqHk?si=02e0f2f2312545a4",
      "https://open.spotify.com/track/3TAtUJc4Sj913Cs5gBUeu0?si=3c3a8ee57e65415b",
      "https://open.spotify.com/track/6SpLc7EXZIPpy0sVko0aoU?si=ee421770165446ba",
      "https://open.spotify.com/track/5ZdrNnYV5VZWds4WXKf8kf?si=40fee2c2fd1448bc",
      "https://open.spotify.com/track/1a3RarhRdrNSTEEERYEFJn?si=2fc1b8ed6b494537",
      "https://open.spotify.com/track/1yPQEVh4z4davqR8Y9iDQT?si=221071d21bc94727",
      "https://open.spotify.com/track/47FyQCd3TYLrZ9TU6MPaWK?si=cfdf5e8d3a0846cb",
      "https://open.spotify.com/track/4EchqUKQ3qAQuRNKmeIpnf?si=7ffb616e69b94dd8",
      "https://open.spotify.com/track/0sNKiz82ATCvT3f3XVVUUj?si=3afbf567bbeb4363",
      "https://open.spotify.com/track/3a2J13Qj9knU0sl4lyWjyF?si=599555eb2b8d4142",
      "https://open.spotify.com/track/0Ti2dlF2xLjXblvdU5fCxM?si=5047b8f76b10490e",
      "https://open.spotify.com/track/0jqK7sGTLsHPkQrrcrGuKD?si=716900644cd14852",
      "https://open.spotify.com/track/1ibeKVCiXORhvUpMmtsQWq?si=391ef8b5863049b0",
      "https://open.spotify.com/track/6hqt1z34Oz0OZtSfy62OFD?si=508a76cb259549ab",
      "https://open.spotify.com/track/24CRDgNOgA72JLL7PHFjgB?si=5c7ddc0ca3944f37",
      "https://open.spotify.com/track/1fJFuvU2ldmeAm5nFIHcPP?si=72ac5b0001974997",
      "https://open.spotify.com/track/4TofVhKSYwFXRtbYo5M3h4?si=38007ffe71fe4a91",
      "https://open.spotify.com/track/3nqm3DdVskqbHhmb8S8hMd?si=e13b1c3850c343c5",
      "https://open.spotify.com/track/6xpDh0dXrkVp0Po1qrHUd8?si=f2fee7eef58841b9",
      "https://open.spotify.com/track/5kr3j5Clb9rjEposoMyLVt?si=bd998980131f424c",
      "https://open.spotify.com/track/6L89mwZXSOwYl76YXfX13s?si=88fe298b53134787",
      "https://open.spotify.com/track/58KPPL1AdLHMvR2O2PZejr?si=93584cbbf15d42eb",
      "https://open.spotify.com/track/390SemxFYgPZ3FfGVqiIqt?si=44b26232b3a64c16",
      "https://open.spotify.com/track/6CVWD0WRqwbR4HsiKHk1j3?si=8588a9851eb3481a",
      "https://open.spotify.com/track/3zca0nsKOLnN28ftZEXAQn?si=2788fdf4b32d46e8",
      "https://open.spotify.com/track/1twBt7aZiy7HWPG025QGuP?si=6062af1721dd42a4",
      "https://open.spotify.com/track/0GrHWVTDsaWcD4nrCGr7VE?si=e5ad07dca69146e2",
      "https://open.spotify.com/track/71dRBSmaKMdaFZPeZlVzf5?si=a30971d4fb594a6f",
      "https://open.spotify.com/track/6cL7NCFSvqWrBH5r4mkvVV?si=b15fdf8234ee4fb9",
      "https://open.spotify.com/track/33ytgjBqchYHhhRfKWMCvH?si=06c6c143907a452d",
      "https://open.spotify.com/track/4Q4w8aRdfhIIEhBututktL?si=ad9a8dabf2004f18",

  ]
}

data "spotify_track" "songs" {
    count = length(var.my-tracks)
    url = var.my-tracks[count.index]
}
