{
  vars,
  lib,
  config,
  pkgs,
  ...
}: {
  options.dev.git.enable = lib.mkEnableOption "Enable git";

  config = lib.mkIf config.dev.git.enable {
    programs = {
      git = {
        enable = true;
        userName = vars.fullName;
        inherit (vars) userEmail;
        # extraConfig = {
        #   commit.gpgsign = true;
        #   gpg.format = "ssh";
        #   gpg.ssh.allowedSignersFile = "~/.ssh/allowed_signers";
        #   user.signingkey =
        #     if osConfig.networking.hostName == "workchng" then
        #       vars.sshPublicKeyWork
        #     else
        #       vars.sshPublicKeyPersonal;
        # };
      };
    };

    home.packages = with pkgs; [
      lazygit
    ];
  };
}
