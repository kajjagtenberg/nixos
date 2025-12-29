{
  lib,
  config,
  ...
}: {
  options.system.wireless.enable = lib.mkEnableOption "Enable wireless networking";

  config = lib.mkIf config.system.wireless.enable {
    networking.wireless.enable = true; # Enables wireless support via wpa_supplicant.
  };
}
