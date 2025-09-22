{
  pkgs,
  lib,
  config,
  ...
}:
{
  options.browser.brave.enable = lib.mkEnableOption "Enable Brave";

  config = lib.mkIf config.browser.brave.enable {
    programs.chromium = {
      enable = true;
      package = pkgs.brave;
      commandLineArgs = [
        "--force-dark-mode"
        "--enable-features=WebUIDarkMode,ForceDarkModeInChrome"
        "--enable-force-dark"
      ];
    };
  };
}
