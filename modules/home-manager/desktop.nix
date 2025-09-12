{
  pkgs,
  ...
}:
{
  programs.firefox.enable = true;
  programs.vscode.enable = true;
  programs.neovim.enable = true;

  home.packages = with pkgs; [
      alacritty
      starship
      protonvpn-cli
  ];
}
