{
  inputs,
  config,
  vars,
  pkgs,
  ...
}:
let
  secretsDirectory = builtins.toString ./secrets;
  secretsFile = "${secretsDirectory}/ssh.yaml";
  homeDirectory = config.home.homeDirectory;
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
    age.keyFile = "${homeDirectory}/.config/sops/age/keys.txt";

    defaultSopsFile = ../../secrets/ssh.yaml;
    defaultSopsFormat = "yaml";

    secrets = {
      "ssh_keys/framework" = {
        path = "/home/kaj/.ssh/id_ecdsa";
      };
    };
  };
}
