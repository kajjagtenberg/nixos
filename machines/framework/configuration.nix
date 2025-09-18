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
    ./../../modules/nixos/systemd-boot.nix
    ./../../modules/nixos/docker.nix
    ./../../modules/nixos/gnome.nix
    ./../../modules/nixos/hyprland.nix
    ./../../modules/nixos/laptop.nix
    ./../../modules/nixos/auto-update.nix
    ./../../modules/nixos/rocm.nix
    ./../../modules/nixos/netbird.nix
    ./../../modules/nixos/yubikey.nix

  ];

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
        ];
      };
    };

  };

  networking.hostName = "framework";
}
