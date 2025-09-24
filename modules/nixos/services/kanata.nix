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
    hardware.uinput.enable = true;

    users.groups.uinput = { };

    services.kanata = {
      enable = true;
      keyboards.default.config = ''
        (defcfg
          process-unmapped-keys yes
        )

        (defsrc
          caps
        )

        (defalias
          caps-mod (tap-hold 100 100 esc lctl)
        )

        (deflayer base
          @caps-mod
        )
      '';
    };

    users.users.kanata = {
      extraGroups = [ "uinput" ];
    };

    users.users.${vars.username} = {
      extraGroups = [ "uinput" ];
    };
  };
}
