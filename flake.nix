{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.home-manager.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.sops-nix.follows = "nixpkgs";
    };
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    let
      inherit (self) outputs;
      vars = import ./vars.nix;
      system = "x86_64-linux";

      mkNixOSConfig =
        path:
        nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs vars; };
          modules = [ path ];
        };

      mkHomeConfig =
        inputs.home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${system};
          extraSpecialArgs = { inherit inputs outputs vars; };
          modules = [
            ./modules/home-manager/base.nix
            ./profiles/home/dev.nix
            ./profiles/home/desktop.nix
          ];
        };
    in
    {
      nixosConfigurations = {
        example = mkNixOSConfig ./machines/example/configuration.nix;
        framework = mkNixOSConfig ./machines/framework/configuration.nix;
        swrm1 = mkNixOSConfig ./machines/swrm1/configuration.nix;
        swrm2 = mkNixOSConfig ./machines/swrm2/configuration.nix;
        swrm3 = mkNixOSConfig ./machines/swrm3/configuration.nix;
      };

      homeConfigurations = {
        ${vars.username} = mkHomeConfig;
      };
    };
}
