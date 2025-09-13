{
  pkgs,
  ...
}:
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
    ];
  };
}
