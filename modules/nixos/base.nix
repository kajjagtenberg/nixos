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

  system.stateVersion = "25.05";
}
