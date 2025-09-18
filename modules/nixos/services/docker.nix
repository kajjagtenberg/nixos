{
  lib,
  config,
  vars,
  ...
}:
{
  options.services.docker.enable = lib.mkEnableOption "Enable docker";

  config = lib.mkIf config.services.docker.enable {
    virtualisation.docker.enable = true;

    users.users.${vars.username} = {
      extraGroups = [ "docker" ];
    };
  };
}
