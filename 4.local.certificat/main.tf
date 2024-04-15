resource "tls_private_key" "example_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "tls_self_signed_cert" "example_cert" {
  # key_algorithm   = "RSA"  # Entfernen Sie diese Zeile, da das Attribut nicht konfigurierbar ist
  private_key_pem = tls_private_key.example_key.private_key_pem
  allowed_uses    = ["server_auth", "client_auth"]
  subject {
    common_name = "example.com"
  }
  validity_period_hours = 24
}


