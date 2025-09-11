{
  ...
}: {

  imports = [
    # ./wireless.nix  TODO: enable for after hardware-configuration is generated
  ];
  
  # Recent kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Enable firmware updates
  services.fwupd.enable = true;

  # Power management
  services.power-profiles-daemon.enable = true;
}