{
  config,
  ...
}:
{
  imports = [
    ../modules/home-manager/dev/default.nix
  ];

  dev.neovim.enable = true;
}
