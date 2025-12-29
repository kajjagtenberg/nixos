{pkgs, ...}: {
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
      dust
      fselect

      protonvpn-gui
      parsec-bin
      protonmail-desktop
      # flyctl
      #
      vial

      wl-clipboard
    ];
  };
}
