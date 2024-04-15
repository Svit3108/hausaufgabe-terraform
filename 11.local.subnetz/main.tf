provider "random" {}

variable "min_subnets" {
  default = 1
}

variable "max_subnets" {
  default = 5
}

resource "random_integer" "subnet_count" {
  min = var.min_subnets
  max = var.max_subnets
}

resource "random_shuffle" "subnet_shuffle" {
  input        = ["10", "20", "30", "40", "50"]
  result_count = random_integer.subnet_count.result
}

locals {
  subnet_bits = 32 - cidrsubnet("10.0.0.0/8", 8, 0)  # Berechne die Anzahl der verbleibenden Bits im Subnetz
  subnets     = [for subnet in random_shuffle.subnet_shuffle[*].result : cidrsubnet("10.0.0.0/8", 8, subnet * (subnet_bits / length(random_shuffle.subnet_shuffle[*].result)))]
}

resource "local_file" "subnets_file" {
  filename = "subnets.txt"
  content  = join("\n", local.subnets)
}






