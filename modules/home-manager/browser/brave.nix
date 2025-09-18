{
  pkgs,
  lib,
  config,
  ...
}:
{
  options.browser.brave.enable = lib.mkEnableOption "Enable Brave";

  config = {
    home.packages = [
      pkgs.brave
    ];
  };
}
