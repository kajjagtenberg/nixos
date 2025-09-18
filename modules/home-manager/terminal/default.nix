{
  pkgs,
  lib,
  config,
  ...
}:
{
  options.terminal.tools.enable = lib.mkEnableOption "Enable terminal tools";

  terminal.tools.enable = lib.mkDefault true;

  config = lib.mkIf config.terminal.tools.enable {
    programs = {
      htop.enable = true;
      vim.enable = true;
      fzf.enable = true;
      fd.enable = true;
      starship.enable = true;
    };
  };
}
