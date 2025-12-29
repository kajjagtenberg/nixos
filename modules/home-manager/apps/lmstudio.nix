{
  lib,
  pkgs,
  config,
  ...
}: {
  options.apps.lmstudio.enable = lib.mkEnableOption "Enable LM Studio";

  config = lib.mkIf config.apps.lmstudio.enable {
    home.packages = [
      pkgs.lmstudio
    ];
  };
}
