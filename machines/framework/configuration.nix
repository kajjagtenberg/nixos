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

    # ./hardware-configuration.nix

    ./../../modules/nixos/base.nix
    ./../../modules/nixos/bootloader.nix
    ./../../modules/nixos/docker.nix
    ./../../modules/nixos/gnome.nix
    ./../../modules/nixos/wireless.nix
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs outputs vars; };
    useGlobalPkgs = true;
    useUserPackages = true;
    users = {
      ${vars.username} = {
        imports = [
          ./../../modules/home-manager/base.nix
          ./../../modules/home-manager/git.nix
          ./../../modules/home-manager/desktop.nix
        ];
      };
    };
  };

  networking.hostName = "nixos";
}
