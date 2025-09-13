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
    starship.enable = true;
    bash = {
      enable = true;
      shellAliases = {
        rebuild = "sudo nixos-rebuild switch --flake github:kajjagtenberg/nixos";
        ga = "git add .";
        gc = "git commit -m ";
        gp = "git push";
        ls = "eza";
        ll = "ls -lha";
        cat = "bat --style=plain --theme=base16 --paging=never ";
        ".." = "cd ..";
      };
      bashrcExtra = ''
        eval "$(starship init bash)"
      '';
    };
  };

}
