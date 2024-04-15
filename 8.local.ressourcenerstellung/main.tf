variable "create_file" {
  type    = bool
  default = true
}

resource "local_file" "example" {
  count = var.create_file ? 1 : 0

  filename = "conditional_file.txt"
  content  = "This file is created conditionally."
}

