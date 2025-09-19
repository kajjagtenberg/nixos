{
  lib,
  config,
  pkgs,
  ...
}:
{
  options.desktop.gnome.enable = lib.mkEnableOption "Enable Gnome" // {
    default = true;
  };

  config = lib.mkIf config.desktop.gnome.enable {
    services.xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
    };

    services.udev.packages = with pkgs; [ gnome-settings-daemon ];
  };
}
