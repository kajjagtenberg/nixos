{
  ...
}:
{
  imports = [
    ../../modules/home-manager/browser
    ../../modules/home-manager/apps
    ../../modules/home-manager/terminal
  ];

  browser.brave.enable = true;
  apps.spotify.enable = true;
  apps.kicad.enable = true;
  terminal.alacritty.enable = true;
}
