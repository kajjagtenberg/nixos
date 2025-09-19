{
  inputs,
  config,
  pkgs,
  lib,
  vars,
  ...
}:
{

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # networking.firewall.enable = false;
  networking.firewall.trustedInterfaces = [ "docker0" ];
  networking.firewall.enable = false;
  networking.firewall.allowedTCPPorts = [ 22 ];

  environment.systemPackages = with pkgs; [
    nfs-utils
    pciutils
  ];

  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      auto-optimise-store = true;
    };
  };

  system.stateVersion = "25.05";
}
