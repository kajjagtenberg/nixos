{
  inputs,
  config,
  vars,
  pkgs,
  ...
}:
let
  secretsFile = "secrets/ssh.yaml";
in
{
  imports = [
    inputs.sops-nix.homeManagerModules.sops
  ];

  home.packages = with pkgs; [
    sops
    age-plugin-yubikey
  ];

  sops = {
    age.keyFile = null;
    defaultSopsFile = "${secretsFile}";

    secrets = {
      "ssh_keys/framework" = {
        path = "/home${vars.username}/.ssh/id_ecdsa";
      };
    };
  };
}
