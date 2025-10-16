{
  lib,
  pkgs,
  config,
  ...
}:
{
  options.apps.bambustudio.enable = lib.mkEnableOption "Enable Bambu Studio";

  config = lib.mkIf config.apps.bambustudio.enable {
    home.packages = [
      pkgs.bambu-studio
    ];
  };
}
