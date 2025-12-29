{
  lib,
  pkgs,
  config,
  ...
}: {
  options.apps.spotify.enable = lib.mkEnableOption "Enable Spotify";

  config = lib.mkIf config.apps.spotify.enable {
    home.packages = [
      pkgs.spotify
    ];
  };
}
