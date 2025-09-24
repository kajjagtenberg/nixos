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
    ./../../modules/nixos/boot/quiet-boot.nix

  ];

  system = {
    wired.enable = true;
    systemd-boot.enable = true;
  };

  security = {
    netbird.enable = true;
    yubikey.enable = true;
    fingerprint.enable = true;
  };

  services = {
    docker.enable = true;
  };

  my.services.ollama.enable = true;

  my.services.kanata.enable = true;

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

          # ../../modules/home-manager/sops.nix
        ];
      };
    };
  };



  #######

  networking.hostName = "framework";

  system.stateVersion = "25.05";
}
