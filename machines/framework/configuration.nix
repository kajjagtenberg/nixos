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
    pkgs.sops-nix.nixosModules.secrets

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

          ./../../profiles/dev.nix
          ./../../profiles/desktop.nix
        ];
      };
    };
  };

  # Define the secret
  sops.secrets = {
    sshPrivateKey = {
      source = ./../../secrets/id_ecdsa;
      target = "/home/${vars.username}/.ssh/id_ecdsa";
      owner = vars.username;
      group = vars.username;
      mode = "0600";
    };
  };

  networking.hostName = "framework";

  system.stateVersion = "25.05";
}
