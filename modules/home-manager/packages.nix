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
    ];
  };
}
