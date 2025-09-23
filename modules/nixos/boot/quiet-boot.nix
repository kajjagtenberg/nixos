{
  # Quiet boot with Plymouth splash screen
  boot = {
    plymouth.enable = true;
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
  systemd.targets.emergency.wants = [ "plymouth-start.service" ];
  systemd.targets.rescue.wants = [ "plymouth-start.service" ];
}