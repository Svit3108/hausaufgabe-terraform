provider "archive" {}

resource "archive_file" "example" {
  type        = "zip"
  source_dir  = "/path/to/source/directory"  # Replace this with the actual path to your source directory
  output_path = "/path/to/output/archive.zip"
}

output "archive_file_path" {
  value = resource.archive_file.example.output_path
}

