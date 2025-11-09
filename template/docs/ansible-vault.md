# Ansible vault

Ansible vault is used to encrypt secrets required by Ansible playbooks.

In order to start using Ansible vault, follow this guide.

## Creating vault password file.

```shell
echo -n <your_vault_password> provision/.vault_pass.txt
```

> [!TIP]
> If you are starting from scratch, you can generate a new vault password with: `openssl rand -hex 16 > provision/.vault_pass.txt`

## Edit your vault

In order to edit your vault secrets, run:

task `ansible:vault-edit`

## Vault location

The main encrypted vault file, is placed at `provision/inventory/<envrionment>/group_vars/<group>/vault.yml`
