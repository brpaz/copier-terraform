
locals {
  commonLabels = {
    "project"     = var.project
    "environment" = var.environment
    "managed_by"  = "terraform"
  }
}

resource "hcloud_ssh_key" "provision" {
  name       = "provision"
  public_key = var.ssh_authorized_key
  labels     = local.commonLabels
}

resource "hcloud_network" "primary" {
  name     = "primary-network"
  ip_range = var.network_cidr
  labels   = local.commonLabels
}

resource "hcloud_network_subnet" "primary_subnet" {
  type         = "cloud"
  network_id   = hcloud_network.primary.id
  network_zone = "eu-central"
  ip_range     = var.subnet_cidr
}

resource "hcloud_server" "webserver" {
  name        = format("webserver-%02d", count.index + 1)
  count       = var.server_count
  server_type = var.server_type
  image       = var.server_image
  location    = var.dc
  user_data   = <<-EOF
    #cloud-config
    users:
      - name: ${var.ssh_user}
        ssh-authorized-keys:
          - ${var.ssh_authorized_key}
        sudo: ['ALL=(ALL) NOPASSWD:ALL']
        groups: sudo
        shell: /bin/bash
    swap:
      filename: /swapfile
      size: "8192M"
  EOF

  #delete_protection = true
  labels = local.commonLabels

  network {
    network_id = hcloud_network.primary.id
  }

  firewall_ids = [hcloud_firewall.public.id]
  depends_on = [
    hcloud_network_subnet.primary_subnet
  ]

  lifecycle {
    ignore_changes = [
      network,
      user_data,
    ]
  }

  provisioner "remote-exec" {
    connection {
      host        = self.ipv4_address
      user        = var.ssh_user
      private_key = file(var.ssh_priv_key_file)
    }

    inline = [
      "while [ ! -f /var/lib/cloud/instance/boot-finished ]; do echo 'Waiting for cloud-init...'; sleep 1; done",
      "echo 'Cloud-init finished.'",
    ]
  }
}

resource "hcloud_firewall" "public" {
  name = "public"
  rule {
    description = "Allow ICMP traffic"
    direction   = "in"
    protocol    = "icmp"
    source_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }

  rule {
    description = "Allow HTTP traffic"
    direction   = "in"
    protocol    = "tcp"
    port        = "80"
    source_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }

  rule {
    description = "Allow HTTPS traffic"
    direction   = "in"
    protocol    = "tcp"
    port        = "443"
    source_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }

  rule {
    description = "Allow SSH traffic"
    direction   = "in"
    protocol    = "tcp"
    port        = "22"
    source_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }
  labels = local.commonLabels
}

resource "cloudflare_dns_record" "whoammi" {
  zone_id  = var.cloudflare_zone_id
  comment  = "Managed by Terraform"
  content  = hcloud_server.webserver[0].ipv4_address
  name     = "whoami.${var.domain}"
  proxied  = false
  settings = {}
  ttl      = 1
  type     = "A"
}
