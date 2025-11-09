output "public_ip_address" {
  value = hcloud_server.webserver[0].ipv4_address
}
