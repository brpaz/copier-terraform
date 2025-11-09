variable "project" {
  description = "The project name"
  type        = string
}

variable "hcloud_token" {
  description = "Hetzner Cloud API token"
  type        = string
  sensitive   = true
}

variable "dc" {
  description = "The Hetzner Cloud datacenter where resources will be created"
  type        = string
  default     = "nbg1"
}

variable "server_count" {
  description = "The number of virtual machine instances to create"
  type        = number
  default     = 1
}

variable "server_type" {
  description = "The server type for the VM instance"
  type        = string
  default     = "cx22"
}

variable "server_image" {
  description = "The image to use for the VM instance (e.g., 'ubuntu-24.04')"
  type        = string
  default     = "ubuntu-24.04"
}

variable "ssh_user" {
  description = "The SSH user for accessing the VM instance"
  type        = string
  default     = "provision"
}

variable "ssh_authorized_key" {
  description = "The SSH public key for the VM instance"
  type        = string
}

variable "ssh_priv_key_file" {
  description = "Path to the private key file for SSH authentication"
  type        = string
  sensitive   = true
}

variable "cloudflare_api_token" {
  description = "Cloudflare API token for managing DNS and security settings"
  type        = string
  sensitive   = true
}

variable "cloudflare_zone_id" {
  description = "Cloudflare Zone ID for the domain"
  type        = string
  sensitive   = true
}

variable "network_cidr" {
  description = "CIDR range for the network (e.g., '10.70.0.0/16')"
  type        = string
  default     = "10.100.0.0/16"
}

variable "subnet_cidr" {
  description = "CIDR range for the subnet (e.g., '10.70.5.0/24')"
  type        = string
  default     = "10.100.1.0/24"
}

variable "environment" {
  description = "Environment for the resources (staging or production)"
  type        = string
  default     = "production"
  validation {
    condition     = contains(["staging", "production"], var.environment)
    error_message = "Invalid environment name. Allowed values are 'staging' and 'production'."
  }
}

variable "domain" {
  description = "Domain name for the infrastructure"
  type        = string
  default     = "brunopaz.xyz"
}
