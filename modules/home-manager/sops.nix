{
  inputs,
  config,
  vars,
  pkgs,
  ...
}:
let
  # secretsDirectory = builtins.toString inputs.secrets;
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

  # home.file.".config/sops/age/keys.txt".text = "AGE-PLUGIN-YUBIKEY-1KV4KSQVZ63R74LGYTE0SP";

  sops = {
    age.keyFile = "${homeDirectory}/.config/sops/age/keys.txt";

    # defaultSopsFile = "${secretsFile}";
    defaultSopsFile = ../../secrets/ssh.yaml;
    defaultSopsFormat = "yaml";
    # validateSopsFiles = false;

    secrets = {
      "ssh_keys/framework" = {
        path = "/home/kaj/.ssh/id_ecdsa";
      };
    };
  };
}
