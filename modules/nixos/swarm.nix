{
  ...
}: {
  imports = [
    ./docker.nix
  ];

  networking.firewall.allowedTCPPorts = [
    2377
  ];
}