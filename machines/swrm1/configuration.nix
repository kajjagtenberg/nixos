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
    ./../../modules/nixos/wired.nix
    ./../../modules/nixos/bootloader.nix
    ./../../modules/nixos/docker.nix
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
        ];
      };
    };
  };

  fileSystems."/mnt/data" = {
    device = "10.0.0.94:/mnt/fast/k8s";
    fsType = "nfs";
    options = [
      "rw"
      "vers=4"
    ];
  };

  networking.hostName = "swrm1";
}
