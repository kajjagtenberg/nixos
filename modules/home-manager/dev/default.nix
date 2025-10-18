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
    ./opencode.nix
  ];

  dev.neovim.enable = lib.mkDefault true;
  dev.git.enable = lib.mkDefault true;
  dev.tmux.enable = lib.mkDefault true;
  dev.opencode.enable = lib.mkDefault true;
}
