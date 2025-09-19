{
  inputs,
  config,
  vars,
  ...
}:
let
  secretsFile = "secrets/ssh.yaml";
in
{
  imports = [
    inputs.sops-nix.homeManagerModules.sops
  ];

  sops = {
    defaultSopsFile = "${secretsFile}";

    secrets = {
      "ssh_keys/framework" = {
        path = "/home${vars.username}/.ssh/id_ecdsa";
      };
    };
  };
}
