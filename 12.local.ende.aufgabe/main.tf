provider "random" {}

resource "random_integer" "red" {
  min = 0
  max = 255
}

resource "random_integer" "green" {
  min = 0
  max = 255
}

resource "random_integer" "blue" {
  min = 0
  max = 255
}

locals {
  rgb_values = {
    red   = random_integer.red.result
    green = random_integer.green.result
    blue  = random_integer.blue.result
  }
}

resource "local_file" "color_scheme" {
  filename = "color_scheme.txt"
  content  = <<-EOT
    RGB Color Scheme:
    Red:   ${local.rgb_values.red}
    Green: ${local.rgb_values.green}
    Blue:  ${local.rgb_values.blue}
  EOT
}
