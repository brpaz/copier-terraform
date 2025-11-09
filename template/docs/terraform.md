<!-- BEGIN_TF_DOCS -->
# Terraform Resources

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.7 |
| <a name="requirement_ansible"></a> [ansible](#requirement\_ansible) | ~> 1.3.0 |
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | ~> 5.0 |
| <a name="requirement_hcloud"></a> [hcloud](#requirement\_hcloud) | ~> 1.49.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_ansible"></a> [ansible](#provider\_ansible) | 1.3.0 |
| <a name="provider_cloudflare"></a> [cloudflare](#provider\_cloudflare) | 5.0.0 |
| <a name="provider_hcloud"></a> [hcloud](#provider\_hcloud) | 1.49.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [ansible_host.webserver](https://registry.terraform.io/providers/ansible/ansible/latest/docs/resources/host) | resource |
| [cloudflare_dns_record.whoammi](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/dns_record) | resource |
| [hcloud_firewall.public](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/firewall) | resource |
| [hcloud_network.primary](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/network) | resource |
| [hcloud_network_subnet.primary_subnet](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/network_subnet) | resource |
| [hcloud_server.webserver](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/server) | resource |
| [hcloud_ssh_key.provision](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/ssh_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloudflare_api_token"></a> [cloudflare\_api\_token](#input\_cloudflare\_api\_token) | Cloudflare API token for managing DNS and security settings | `string` | n/a | yes |
| <a name="input_cloudflare_zone_id"></a> [cloudflare\_zone\_id](#input\_cloudflare\_zone\_id) | Cloudflare Zone ID for the domain | `string` | n/a | yes |
| <a name="input_dc"></a> [dc](#input\_dc) | The Hetzner Cloud datacenter where resources will be created | `string` | `"nbg1"` | no |
| <a name="input_domain"></a> [domain](#input\_domain) | Domain name for the infrastructure | `string` | `"brunopaz.xyz"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment for the resources (staging or production) | `string` | `"production"` | no |
| <a name="input_hcloud_token"></a> [hcloud\_token](#input\_hcloud\_token) | Hetzner Cloud API token | `string` | n/a | yes |
| <a name="input_network_cidr"></a> [network\_cidr](#input\_network\_cidr) | CIDR range for the network (e.g., '10.70.0.0/16') | `string` | `"10.100.0.0/16"` | no |
| <a name="input_project"></a> [project](#input\_project) | The project name | `string` | n/a | yes |
| <a name="input_server_count"></a> [server\_count](#input\_server\_count) | The number of virtual machine instances to create | `number` | `1` | no |
| <a name="input_server_image"></a> [server\_image](#input\_server\_image) | The image to use for the VM instance (e.g., 'ubuntu-24.04') | `string` | `"ubuntu-24.04"` | no |
| <a name="input_server_type"></a> [server\_type](#input\_server\_type) | The server type for the VM instance | `string` | `"cx22"` | no |
| <a name="input_ssh_authorized_key"></a> [ssh\_authorized\_key](#input\_ssh\_authorized\_key) | The SSH public key for the VM instance | `string` | n/a | yes |
| <a name="input_ssh_priv_key_file"></a> [ssh\_priv\_key\_file](#input\_ssh\_priv\_key\_file) | Path to the private key file for SSH authentication | `string` | n/a | yes |
| <a name="input_ssh_user"></a> [ssh\_user](#input\_ssh\_user) | The SSH user for accessing the VM instance | `string` | `"provision"` | no |
| <a name="input_subnet_cidr"></a> [subnet\_cidr](#input\_subnet\_cidr) | CIDR range for the subnet (e.g., '10.70.5.0/24') | `string` | `"10.100.1.0/24"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_public_ip_address"></a> [public\_ip\_address](#output\_public\_ip\_address) | n/a |
<!-- END_TF_DOCS -->