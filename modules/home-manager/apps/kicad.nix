{
  lib,
  pkgs,
  config,
  ...
}: {
  options.apps.kicad.enable = lib.mkEnableOption "Enable Kicad";

  config = lib.mkIf config.apps.kicad.enable {
    home.packages = [
      pkgs.kicad-small
    ];
  };
}
