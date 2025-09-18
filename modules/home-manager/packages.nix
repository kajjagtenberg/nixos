{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      curl
      wget
      ripgrep
      eza
      bat
      dig
      dogdns
      fastfetch
      lazygit
      lazydocker
      zoxide
      xh
      du-dust
      fselect

      protonvpn-cli
      protonvpn-gui
      spotify
      parsec-bin
      protonmail-desktop
      flyctl

      wl-clipboard
    ];
  };
}
