{
  ...
}:
{
  options.my.dev.neovim.enable = lib.mkEnableOption "Enable neovim";

  # === 2. Default configuration (empty if disabled) ===
  config = lib.mkIf (config.my.dev.neovim.enable or false) {
    programs.neovim = {
      enable = true;
      vimAlias = true; # make `vim` point to `nvim`
      viAlias = true; # make `vi` point to `nvim`
      extraPackages = with pkgs; [
        fzf
        ripgrep
      ];
    };
  };
}
