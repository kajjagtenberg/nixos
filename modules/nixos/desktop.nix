{
  pkgs,
  vars,
  ...
}:
{
  fonts.packages = with pkgs; [ nerd-fonts.jetbrains-mono ];
}
