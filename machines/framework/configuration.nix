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

    ./hardware-configuration.nix

    ./../../modules/nixos/base.nix
    ./../../modules/nixos/docker.nix
    ./../../modules/nixos/gnome.nix
    ./../../modules/nixos/hyprland.nix
    # ./../../modules/nixos/laptop.nix
    # ./../../modules/nixos/rocm.nix

    ./../../modules/nixos/system
    ./../../modules/nixos/security
  ];

  system = {
    systemd-boot.enable = true;
    wired.enable = true;
  };

  security = {
    netbird.enable = true;
    yubikey.enable = true;
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs outputs vars; };
    useGlobalPkgs = true;
    useUserPackages = true;
    users = {
      ${vars.username} = {
        imports = [
          ./../../modules/home-manager/base.nix
          ./../../modules/home-manager/desktop.nix

          ./../../profiles/dev.nix
          ./../../profiles/desktop.nix
        ];
      };
    };

  };

  networking.hostName = "framework";
}
