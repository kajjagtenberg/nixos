{
  lib,
  config,
  pkgs,
  ...
}:
{
  options.services.ollama.enable = lib.mkEnableOption "Enable ollama";

  config = lib.mkIf config.services.ollama.enable {
    services.ollama.enable = true;
  };
}
