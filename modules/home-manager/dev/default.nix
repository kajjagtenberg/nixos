{
  pkgs,
  lib,
  ...
}:
{
  imports = [
    ./neovim.nix
    ./git.nix
  ];

  dev.neovim.enable = lib.mkDefault true;
  dev.git.enable = lib.mkDefault true;
}
