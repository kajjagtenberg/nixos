{
  pkgs,
  vars,
  ...
}:
{
  fonts.packages = with pkgs; [ nerdfonts ];
}
