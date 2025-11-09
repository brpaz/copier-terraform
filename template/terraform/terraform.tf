/**
  * Terraform configuration file
  *
  * This file contains the configuration for the Terraform CLI.
  * It defines the required version of Terraform, the required providers,
  * and the backend configuration.
  *
  * @see https://www.terraform.io/docs/configuration/index.html
  */
terraform {
  required_version = ">= 1.7"
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5.0"
    }
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "~> 1.49.0"
    }
    ansible = {
      version = "~> 1.3.0"
      source  = "ansible/ansible"
    }
  }

  // Backend configuration
  cloud {
    organization = "brunopazdev"

    workspaces {
      name    = "production"
      project = "infrastucture-template"
    }
  }
}

provider "hcloud" {
  token = var.hcloud_token
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}
