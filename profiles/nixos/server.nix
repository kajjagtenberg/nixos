{
  ...
}:
{
  imports = [
    ../../modules/nixos/bootloader.nix

    ../../modules/nixos/security
    ../../modules/nixos/system
    ../../modules/nixos/services
  ];

  security = {
    netbird.enable = true;
  };

  system = {
    wired.enable = true;
  };
}
