{
  lib,
  config,
  ...
}: {
  options.security.netbird.enable = lib.mkEnableOption "Enable netbird";

  config = lib.mkIf config.security.netbird.enable {
    services.netbird.enable = true;
  };
}
