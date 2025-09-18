{
  config,
  ...
}:
{
  imports = [
    ../modules/home-manager/dev/default.nix
  ];

  dev.neovim.enable = true;
  dev.git.enable = true;
}
