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
      lazydocker
      xh
      du-dust
      fselect

      protonvpn-cli
      protonvpn-gui
      parsec-bin
      protonmail-desktop
      flyctl

      wl-clipboard
    ];
  };
}
