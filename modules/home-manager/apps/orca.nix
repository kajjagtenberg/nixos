{
  lib,
  pkgs,
  config,
  ...
}:
{
  options.apps.orca.enable = lib.mkEnableOption "Enable Orca Slicer";

  config = lib.mkIf config.apps.orca.enable {
    home.packages = [
      pkgs.orca-slicer
    ];
  };
}
