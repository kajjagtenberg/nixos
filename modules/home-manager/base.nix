{
  vars,
  ...
}:
{
  imports = [
    ./packages.nix
  ];

  home = {
    username = vars.username;
    # homeDirectory = lib.mkMerge [
    #   (lib.mkIf pkgs.stdenv.isLinux "/home/${vars.userName}")
    #   (lib.mkIf pkgs.stdenv.isDarwin "/Users/${vars.userName}")
    # ];

    stateVersion = "25.05";
    # sessionVariables = lib.mkIf pkgs.stdenv.isDarwin {
    #   SOPS_AGE_KEY_FILE = "$HOME/.config/sops/age/keys.txt";
    # };
  };

  programs = {
    htop.enable = true;
    vim.enable = true;
    fzf.enable = true;
  };

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "nl_NL.UTF-8";
    LC_IDENTIFICATION = "nl_NL.UTF-8";
    LC_MEASUREMENT = "nl_NL.UTF-8";
    LC_MONETARY = "nl_NL.UTF-8";
    LC_NAME = "nl_NL.UTF-8";
    LC_NUMERIC = "nl_NL.UTF-8";
    LC_PAPER = "nl_NL.UTF-8";
    LC_TELEPHONE = "nl_NL.UTF-8";
    LC_TIME = "nl_NL.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

}
