{
  inputs,
  outputs,
  config,
  pkgs,
  vars,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager

    ./hardware-configuration.nix

    ./../../modules/nixos/nfs/docker.nix

    ../../profiles/nixos/server.nix
    ../../modules/nixos/boot/quiet-boot.nix
  ];

  home-manager = {
    extraSpecialArgs = {inherit inputs outputs vars;};
    useGlobalPkgs = true;
    useUserPackages = true;
    users = {
      ${vars.username} = {
        imports = [
          ./../../modules/home-manager/base.nix
          # ./../../modules/home-manager/git.nix
          #
          ../../modules/home-manager/dev
          ../../modules/home-manager/terminal
        ];
      };
    };
  };

  networking.hostName = "swrm2";

  system.stateVersion = "25.05";
}
