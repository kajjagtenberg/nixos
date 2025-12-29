{
  lib,
  config,
  pkgs,
  ...
}: {
  options.my.services.ollama.enable = lib.mkEnableOption "Enable ollama";

  config = lib.mkIf config.my.services.ollama.enable {
    services.ollama.enable = true;
  };
}
