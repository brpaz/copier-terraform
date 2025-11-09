# GitHub Actions

This project uses [GitHub actions](https://docs.github.com/en/actions) as CI/CD Pipeline. The following workflows are available:

- **ansible-lint** - Runs when an Ansible related file is modified and uses [Ansible](https://ansible.readthedocs.io/projects/lint/) Lint to lint roles and playbooks.
- **ansible-playbook** - Runs an Ansible playbook against the provisioned infrastructure.
- **terraform** - Runs terraform to provision the infrastructure.

## Workflow secrets

The following workflow secrets must be set:


| Secret Name                   | Purpose                                                                                                                                          | Required |
| ----------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------ | -------- |
| `TF_API_TOKEN`                | API token for authenticating with Terraform Cloud. Generate one [here](https://app.terraform.io/app/brunopazdev/settings/authentication-tokens). | ✅        |
| `TF_VAR_cloudflare_api_token` | API token for authenticating with Cloudflare, used by Terraform to manage Cloudflare resources.                                                  | ✅        |
| `TF_VAR_cloudflare_zone_id`   | Cloudflare Zone ID, specifying which domain or zone Terraform should manage.                                                                     | ✅        |
| `TF_VAR_hcloud_token`         | Hetzner Cloud API token, allowing Terraform to manage infrastructure in Hetzner Cloud.                                                           | ✅        |
| `TF_VAR_ssh_authorized_key`   | Public SSH key used for provisioning and accessing cloud instances securely.                                                                     | ✅        |
|                               |
