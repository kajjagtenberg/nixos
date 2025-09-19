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

    ./../../modules/nixos/nfs/docker.nix

    ../../profiles/nixos/server.nix
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs outputs vars; };
    useGlobalPkgs = true;
    useUserPackages = true;
    users = {
      ${vars.username} = {
        imports = [
          ./../../modules/home-manager/base.nix
          # ./../../modules/home-manager/git.nix
          #
          ../../modules/home-manager/dev
        ];
      };
    };
  };

  networking.hostName = "swrm1";

  system.stateVersion = "25.05";
}
