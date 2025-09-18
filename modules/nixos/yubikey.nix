{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    yubioath-flutter
    yubikey-manager
    pam_u2f
  ];

  services.udev.packages = [ pkgs.yubikey-personalization ];

  services.yubikey-agent.enable = true;
}
