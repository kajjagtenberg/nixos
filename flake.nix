{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    let
      inherit (self) outputs;
      vars = import ./vars.nix;

      mkNixOSConfig =
        path:
        nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs vars; };
          modules = [ path ];
        };
    in
    {

      # packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;

      # packages.x86_64-linux.default = self.packages.x86_64-linux.hello;

      nixosConfigurations = {
        example = mkNixOSConfig ./machines/example/configuration.nix;
      };
    };
}
