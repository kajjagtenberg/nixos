{ config, pkgs, lib, ... }:
let
  lock-false = {
    Value = false;
    Status = "locked";
  };
  lock-true = {
    Value = true;
    Status = "locked";
  };

  lazyvim = builtins.fetchGit {
    url = "https://github.com/LazyVim/LazyVim.git";
    rev = "803bc181d7c0d6d5eeba9274d9be49b287294d99";
  };
in {
  programs.vscode.enable = true;
  programs.neovim = { enable = true; };

  # home.file.".config/nvim/lua".source = lazyvim;

  home.file.".tmux.conf".source = pkgs.fetchFromGitHub {
    owner = "kajjagtenberg";
    repo = "tmux";
    rev = "d13ecfe";
    sha256 = "sha256-O3yHOWlXKvJL+wToO53kSZK09BNGRRx7dk3blMpETXs=";
  } + "/tmux.conf";

  programs.tmux = {
    enable = true;
    baseIndex = 1;
    plugins = with pkgs.tmuxPlugins; [
      sensible
      yank
      vim-tmux-navigator
      {
        plugin = catppuccin;
        extraConfig = ''set -g @catppuccin_flavour "mocha"'';
      }
    ];
  };

  home.packages = with pkgs; [
    protonvpn-cli
    protonvpn-gui
    spotify
    parsec-bin
    protonmail-desktop
    brave
    flyctl
  ];

  # inspo: https://discourse.nixos.org/t/declare-firefox-extensions-and-settings/36265
  programs = {
    firefox = {
      enable = true;
      languagePacks = [ "en-US" ];

      # ---- POLICIES ----
      # Check about:policies#documentation for options.
      policies = {
        DisableTelemetry = true;
        DisableFirefoxStudies = true;
        EnableTrackingProtection = {
          Value = true;
          Locked = true;
          Cryptomining = true;
          Fingerprinting = true;
        };
        DisablePocket = true;
        DisableFirefoxAccounts = true;
        DisableAccounts = true;
        DisableFirefoxScreenshots = true;
        OverrideFirstRunPage = "";
        OverridePostUpdatePage = "";
        DontCheckDefaultBrowser = true;
        DisplayBookmarksToolbar = "never"; # alternatives: "always" or "newtab"
        DisplayMenuBar =
          "default-off"; # alternatives: "always", "never" or "default-on"
        SearchBar = "unified"; # alternative: "separate"

        # ---- EXTENSIONS ----
        # Check about:support for extension/add-on ID strings.
        # Valid strings for installation_mode are "allowed", "blocked",
        # "force_installed" and "normal_installed".
        # ExtensionSettings = {
        #   "*".installation_mode = "blocked"; # blocks all addons except the ones specified below
        #   # uBlock Origin:
        #   "uBlock0@raymondhill.net" = {
        #     install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
        #     installation_mode = "force_installed";
        #   };
        #   # Privacy Badger:
        #   "jid1-MnnxcxisBPnSXQ@jetpack" = {
        #     install_url = "https://addons.mozilla.org/firefox/downloads/latest/privacy-badger17/latest.xpi";
        #     installation_mode = "force_installed";
        #   };
        #   # 1Password:
        #   "{d634138d-c276-4fc8-924b-40a0ea21d284}" = {
        #     install_url = "https://addons.mozilla.org/firefox/downloads/latest/1password-x-password-manager/latest.xpi";
        #     installation_mode = "force_installed";
        #   };
        # };

        # ---- PREFERENCES ----
        # Check about:config for options.
        Preferences = {
          "browser.contentblocking.category" = {
            Value = "strict";
            Status = "locked";
          };
          "extensions.pocket.enabled" = lock-false;
          "extensions.screenshots.disabled" = lock-true;
          "browser.topsites.contile.enabled" = lock-false;
          "browser.formfill.enable" = lock-false;
          "browser.search.suggest.enabled" = lock-false;
          "browser.search.suggest.enabled.private" = lock-false;
          "browser.urlbar.suggest.searches" = lock-false;
          "browser.urlbar.showSearchSuggestionsFirst" = lock-false;
          "browser.newtabpage.activity-stream.feeds.section.topstories" =
            lock-false;
          "browser.newtabpage.activity-stream.feeds.snippets" = lock-false;
          "browser.newtabpage.activity-stream.section.highlights.includePocket" =
            lock-false;
          "browser.newtabpage.activity-stream.section.highlights.includeBookmarks" =
            lock-false;
          "browser.newtabpage.activity-stream.section.highlights.includeDownloads" =
            lock-false;
          "browser.newtabpage.activity-stream.section.highlights.includeVisited" =
            lock-false;
          "browser.newtabpage.activity-stream.showSponsored" = lock-false;
          "browser.newtabpage.activity-stream.system.showSponsored" =
            lock-false;
          "browser.newtabpage.activity-stream.showSponsoredTopSites" =
            lock-false;
        };
      };
    };
  };

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
        decorations = lib.mkMerge [ "Full" ];
        dynamic_padding = true;
        padding = {
          x = 4;
          y = 4;
        };
        opacity = 0.75;
      };

      font = {
        size = lib.mkMerge [ 14 ];
        normal = {
          family = "JetBrainsMono Nerd Font";
          style = "Regular";
        };
      };

      keyboard = {
        bindings = [{
          key = "Return";
          mods = "Shift";
          chars = "\n";
        }];
      };
    };
  };
}
