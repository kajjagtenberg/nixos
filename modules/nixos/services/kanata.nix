{
  lib,
  config,
  vars,
  ...
}:
{
  options.my.services.kanata = {
    enable = lib.mkEnableOption "Enable kanata keyboard remapping";
    config = lib.mkOption {
      type = lib.types.str;
      default = "";
      description = "Kanata configuration content";
    };
  };

  config = lib.mkIf config.my.services.kanata.enable {
    services.kanata = {
      enable = true;
      keyboards.default.config = config.my.services.kanata.config;
    };

    users.users.${vars.username} = {
      extraGroups = [ "input" ];
    };
  };
}