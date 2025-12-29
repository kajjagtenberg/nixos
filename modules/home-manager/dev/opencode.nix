{
  lib,
  pkgs,
  config,
  ...
}: {
  options.dev.opencode.enable = lib.mkEnableOption "Enable opencode";

  config = lib.mkIf (config.dev.opencode.enable or false) {
    home.packages = with pkgs; [
      opencode
    ];
  };
}
