{ pkgs, lib, config, inputs, ... }:

{
  dotenv.enable = true;

  languages.terraform.enable = true;
  languages.ansible.enable = true;

  # https://devenv.sh/packages/
  packages = [
    pkgs.git
    pkgs.tflint
    pkgs.terraform-docs
    pkgs.python312Packages.docker
  ];

  enterShell = ''
    if [ ! -f .env ]; then
      cp .env.example .env
    fi

    if [ ! -f terraform/terraform.tfvars ]; then
      cp terraform/terraform.tfvars.example terraform/.terraform.tfvars
    fi
    lefthook install
  '';
}
