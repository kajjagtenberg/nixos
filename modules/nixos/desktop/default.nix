{pkgs, ...}: {
  imports = [
    ./gnome.nix
    ./hyprland.nix
  ];

  fonts.packages = with pkgs; [nerd-fonts.jetbrains-mono];

  programs.steam.enable = true;
}
