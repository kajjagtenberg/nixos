{
  inputs,
  config,
  pkgs,
  lib,
  vars,
  ...
}:
{

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # networking.firewall.enable = false;
  networking.firewall.trustedInterfaces = [ "docker0" ];
  networking.firewall.enable = false;
  networking.firewall.allowedTCPPorts = [ 22 ];

  system.stateVersion = "25.05";
}
