data "template_file" "config_template" {
  template = <<-EOF
{
  "user": "${var.user}",
  "password": "${var.password}"
}
  EOF
}


 variable "user" {
  type    = string
  default = "username"
}

variable "password" {
  type    = string
  default = "secretpassword"
}



resource "local_file" "config_json" {
  filename = "config.json"
  content  = data.template_file.config_template.rendered
}
