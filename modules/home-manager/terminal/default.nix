{
  pkgs,
  lib,
  config,
  ...
}:
{
  imports = [
    ./bash.nix
  ];

  terminal.bash.enable = lib.mkDefault true;

  options.terminal.tools.enable = lib.mkEnableOption "Enable terminal tools" // {
    default = true;
  };

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
