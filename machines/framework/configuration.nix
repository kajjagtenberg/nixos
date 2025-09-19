{
  inputs,
  outputs,
  config,
  pkgs,
  vars,
  ...
}:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    inputs.sops-nix.nixosModules.sops

    ./hardware-configuration.nix

    # ./../../modules/nixos/laptop.nix
    # ./../../modules/nixos/rocm.nix

    ./../../modules/nixos/services
    ./../../modules/nixos/system
    ./../../modules/nixos/security
    ./../../modules/nixos/desktop

  ];

  system = {
    systemd-boot.enable = true;
    wired.enable = true;
  };

  security = {
    netbird.enable = true;
    yubikey.enable = true;
    fingerprint.enable = true;
  };

  services = {
    docker.enable = true;
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs outputs vars; };
    useGlobalPkgs = true;
    useUserPackages = true;
    users = {
      ${vars.username} = {
        imports = [
          ./../../modules/home-manager/base.nix

          ./../../profiles/home/dev.nix
          ./../../profiles/home/desktop.nix

          ../../modules/home-manager/sops.nix
        ];
      };
    };
  };

  #######

  # sops.defaultSopsFile = builtins.toString ./secrets/ssh.yaml;
  # sops.defaultSopsFormat = "yaml";
  #
  # sops.age.keyFile = null;
  #
  # sops.secrets = {
  #   "ssh_keys/framework" = {
  #     path = "/home/${vars.username}/.ssh/id_ecdsa";
  #   };
  # };
  sops = {
    age.keyFile = "/home/kaj/.config/sops/age/keys.txt";

    # defaultSopsFile = "${secretsFile}";
    defaultSopsFile = ../../secrets/ssh.yaml;
    # defaultSopsFormat = "yaml";
    # validateSopsFiles = false;

    # secrets = {
    #   "ssh_keys/framework" = {
    #     path = "/home/kaj/.ssh/id_ecdsa";
    #   };
    # };
    #
    secrets."ssh_keys/framework" = {
      path = "/home/${vars.username}/.ssh/id_ecdsa";
      owner = vars.username;
    };
    secrets.example = {
      neededForUsers = true;
      owner = "kaj";
    };
  };

  #######

  networking.hostName = "framework";

  system.stateVersion = "25.05";
}
