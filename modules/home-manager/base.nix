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

}
