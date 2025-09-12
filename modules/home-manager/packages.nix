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
      exa
      bat
      gcc
    ];
  };
}
