{
  ...
}:
{
  imports = [
    ./docker.nix
  ];

  networking.firewall = {
    allowedTCPPorts = [
      2377
      9000
      9443
      7946
    ];
    allowedUDPPorts = [
      4789
      7946
    ];
  };
}
