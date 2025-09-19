{
  inputs,
  config,
  pkgs,
  lib,
  vars,
  ...
}:
{
  users.users.${vars.username} = {
    isNormalUser = true;
    description = vars.username;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    openssh.authorizedKeys.keys = vars.sshPublicKeyPersonal;
    # shell = pkgs.zsh;
    # hashedPasswordFile = config.sops.secrets."user-password".path;
  };

  security.sudo.extraRules = [
    {
      users = [ vars.username ];
      commands = [
        {
          command = "ALL";
          options = [ "NOPASSWD" ];
        }
      ];
    }
  ];
}
