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

    home.packages = with pkgs; [
      zoxide
    ];
  };
}
