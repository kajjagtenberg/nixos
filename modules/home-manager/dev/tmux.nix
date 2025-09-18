{
  pkgs,
  lib,
  config,
  ...
}:
{
  options.dev.tmux.enable = lib.mkEnableOption "Enable tmux";

  config = lib.mkIf config.dev.tmux.enable {
    home.file.".tmux.conf".source =
      pkgs.fetchFromGitHub {
        owner = "kajjagtenberg";
        repo = "tmux";
        rev = "d13ecfe";
        sha256 = "sha256-O3yHOWlXKvJL+wToO53kSZK09BNGRRx7dk3blMpETXs=";
      }
      + "/tmux.conf";

    programs.tmux = {
      enable = true;
      baseIndex = 1;
      plugins = with pkgs.tmuxPlugins; [
        sensible
        yank
        vim-tmux-navigator
        {
          plugin = catppuccin;
          extraConfig = ''set -g @catppuccin_flavour "mocha"'';
        }
      ];
    };
  };
}
