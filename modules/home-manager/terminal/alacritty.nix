{
  lib,
  config,
  pkgs,
  ...
}: {
  options.terminal.alacritty.enable = lib.mkEnableOption "Enable alacritty";

  config = lib.mkIf config.terminal.alacritty.enable {
    programs.alacritty = {
      enable = true;
      settings = {
        colors = {
          bright = {
            black = "0x737475";
            blue = "0x959697";
            cyan = "0xb15928";
            green = "0x2e2f30";
            magenta = "0xdadbdc";
            red = "0xe6550d";
            white = "0xfcfdfe";
            yellow = "0x515253";
          };
          cursor = {
            cursor = "0xb7b8b9";
            text = "0x0c0d0e";
          };
          normal = {
            black = "0x0c0d0e";
            blue = "0x3182bd";
            cyan = "0x80b1d3";
            green = "0x31a354";
            magenta = "0x756bb1";
            red = "0xe31a1c";
            white = "0xb7b8b9";
            yellow = "0xdca060";
          };
          primary = {
            # background = "0x0c0d0e";
            background = "#0a0920";
            foreground = "#b7b8b9";
          };
        };

        cursor = {
          unfocused_hollow = true;
          style.blinking = "On";
        };

        window = {
          dimensions = {
            lines = 30;
            columns = 150;
          };
          decorations = lib.mkMerge ["Full"];
          dynamic_padding = true;
          padding = {
            x = 4;
            y = 4;
          };
          opacity = 0.75;
        };

        font = {
          size = lib.mkMerge [14];
          normal = {
            family = "JetBrainsMono Nerd Font";
            style = "Regular";
          };
        };

        keyboard = {
          bindings = [
            {
              key = "Return";
              mods = "Shift";
              chars = "\n";
            }
          ];
        };
      };
    };
  };
}
