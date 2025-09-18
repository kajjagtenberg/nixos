{ config, lib, ... }:
{
  options.system.systemd-boot.enable = lib.mkEnableOption "Enable systemd-boot";

  config = lib.mkIf config.system.systemd-boot.enable {
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
  };
}
