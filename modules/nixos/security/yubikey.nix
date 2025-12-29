{
  lib,
  config,
  pkgs,
  ...
}: {
  options.security.yubikey.enable = lib.mkEnableOption "Enable yubikey";
  config = lib.mkIf config.security.yubikey.enable {
    environment.systemPackages = with pkgs; [
      yubioath-flutter
      yubikey-manager
      pam_u2f

      sops
      age
      age-plugin-yubikey
    ];

    services.udev.packages = [pkgs.yubikey-personalization];
    services.pcscd.enable = true;

    services.yubikey-agent.enable = true;
  };
}
