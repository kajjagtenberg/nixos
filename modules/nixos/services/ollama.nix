{
  lib,
  config,
  pkgs,
  ...
}:
{
  options.services.ollama.enable = lib.mkEnableOption "Enable ollama";

  config = lib.mkIf config.serices.ollama.enable {
    services.ollama.enable = true;
  };
}
