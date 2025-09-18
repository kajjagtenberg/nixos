{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      curl
      wget
      ripgrep
      nixfmt
      eza
      bat
      gcc
      dig
      dogdns
      fastfetch
      lazygit
      lazydocker
      zoxide
      xh
      du-dust
      fselect
      tokei

      protonvpn-cli
      protonvpn-gui
      spotify
      parsec-bin
      protonmail-desktop
      brave
      flyctl

      nil

      wl-clipboard
    ];
  };
}
