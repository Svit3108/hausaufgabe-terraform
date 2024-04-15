resource "random_string" "random_filename" {
  length = 10
}

output "random_filename_output" {
  value = random_string.random_filename.result
}
