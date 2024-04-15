provider "http" {}

data "http" "chuck_norris_joke" {
  url = "https://api.chucknorris.io/jokes/random"
}

resource "local_file" "chuck_norris_joke" {
  filename = "chuck_norris_joke.json"
  content  = data.http.chuck_norris_joke.body
}
