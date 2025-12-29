{
  lib,
  config,
  ...
}: {
  options.system.wired.enable = lib.mkEnableOption "Enabled wired networking";

  config = lib.mkIf config.system.wired.enable {
    networking.networkmanager.enable = true;
  };
}
