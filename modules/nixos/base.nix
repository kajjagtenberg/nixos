{
  inputs,
  config,
  pkgs,
  vars,
  ...
}:
{
  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Amsterdam";

  users.users.${vars.username} = {
    isNormalUser = true;
    description = vars.username;
    extraGroups = ["networkmanager" "wheel"];
    # openssh.authorizedKeys.keys = [
    #   vars.sshPublicKeyPersonal
    # ];
    # shell = pkgs.zsh;
    # hashedPasswordFile = config.sops.secrets."user-password".path;
  };

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    settings = {
      experimental-features = [
    "nix-command"
    "flakes"
  ];
      auto-optimise-store = true;
    };
  };
}
