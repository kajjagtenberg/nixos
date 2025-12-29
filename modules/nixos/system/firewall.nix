{...}: {
  # networking.firewall.enable = false;
  networking.firewall.trustedInterfaces = ["docker0"];
  networking.firewall.enable = false;
  networking.firewall.allowedTCPPorts = [22];
}
