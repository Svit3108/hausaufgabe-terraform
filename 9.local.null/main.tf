resource "null_resource" "run_script" {
  triggers = {
    always_run = timestamp()
  }

  provisioner "local-exec" {
    command = "bash -c './your_script.sh'"  # Passe den Pfad zum Skript entsprechend an
  }
}


