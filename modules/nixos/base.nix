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

  system.stateVersion = "25.05";
}
