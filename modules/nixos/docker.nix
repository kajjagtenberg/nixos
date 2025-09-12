{
  vars,
  ...
}:
{
  virtualisation.docker.enable = true;

  users.users.${vars.username} = {
    extraGroups = [
      "docker"
    ];
  };

  networking.firewall.allowedTCPPorts = [
    2377
  ];
}
