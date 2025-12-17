{
  pkgs,
  ...
}:
{
  # Quiet boot with Plymouth splash screen
  boot = {
    # plymouth.enable = true;
    consoleLogLevel = 0;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "splash"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
    ];
  };

  # Hide systemd service status
  # systemd.targets.emergency.wants = [ "plymouth-start.service" ];
  # systemd.targets.rescue.wants = [ "plymouth-start.service" ];

  # Ensure Plymouth doesn't interfere with suspend
  systemd.services.plymouth-quit = {
    description = "Quit Plymouth before suspend";
    wantedBy = [ "suspend.target" ];
    before = [ "suspend.target" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.plymouth}/bin/plymouth quit";
      RemainAfterExit = true;
    };
  };
}
