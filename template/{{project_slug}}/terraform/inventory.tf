# Setup ansible hosts to be used with the Ansible Terraform Dynamic Inventory provider
# See:
# https://registry.terraform.io/providers/ansible/ansible/latest/docs
# https://withdevo.net/2023/07/12/terraform-ansible-working-together/
resource "ansible_host" "webserver" {
  count = length(hcloud_server.webserver)
  name  = "webserver-${format("%02d", count.index + 1)}"

  groups = ["webservers"]
  variables = {
    ansible_user = var.ssh_user
    ansible_host = hcloud_server.webserver[count.index].ipv4_address
  }
}
