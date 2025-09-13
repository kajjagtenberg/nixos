{
  ...
}:
{
  imports = [
    ./docker.nix
  ];

  networking.firewall.allowedTCPPorts = [
    2377
    9000
    9443
  ];
}
