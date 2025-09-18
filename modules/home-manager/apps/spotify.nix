{
  pkgs,
  lib,
  config,
  ...
}:
{
  options.apps.spotify.enable = lib.mkEnableOption "Enable Spotify";

  config = lib.mkIf options.apps.spotify.enable {
    home.packages = [
      pkgs.spotify
    ];
  };
}
