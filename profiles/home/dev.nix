{
  config,
  ...
}:
{
  imports = [
    ../../modules/home-manager/dev
    ../../modules/home-manager/terminal
  ];

  terminal.alacritty.enable = true;
  dev.opencode.enable = true;
}
