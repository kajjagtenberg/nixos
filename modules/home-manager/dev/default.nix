{
  pkgs,
  lib,
  ...
}:
{
  imports = [
    ./neovim.nix
  ];

  dev.neovim.enable = lib.mkDefault true;
}
