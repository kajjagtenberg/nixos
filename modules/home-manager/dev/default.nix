{
  pkgs,
  lib,
  ...
}:
{
  imports = [
    ./neovim.nix
    ./git.nix
    ./tmux.nix
  ];

  dev.neovim.enable = lib.mkDefault true;
  dev.git.enable = lib.mkDefault true;
  dev.tmux.enable = lib.mkDefault true;
}
