{
  lib,
  pkgs,
  config,
  ...
}:
{
  options.dev.opencode.enable = lib.mkEnableOption "Enable opencode";

  config = lib.mkIf (config.dev.opencode.enable or false) {
    programs.opencode = {
      enable = true;
      settings = {
        theme = "tokyonight";
        # autoupdate = true;
        # mcp = {
        #   context7 = {
        #     type = "remote";
        #     # url = "https://mcp.context7.com/mcp";
        #   };
        # };
      };
    };

    # home.packages = with pkgs; [
    #   opencode
    # ];
  };
}
