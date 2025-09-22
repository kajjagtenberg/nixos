{
  pkgs,
  lib,
  config,
  ...
}:
{
  options.dev.tmux.enable = lib.mkEnableOption "Enable tmux";

  config = lib.mkIf config.dev.tmux.enable {
    programs.tmux = {
      enable = true;
      baseIndex = 1;
      mouse = true;
      prefix = "C-Space";
      keyMode = "vi";
      extraConfig = ''
        # Terminal overrides for true color support
        set-option -sa terminal-overrides ",xterm*:Tc"

        # Start panes at 1
        set -g pane-base-index 1
        set-window-option -g pane-base-index 1

        # Renumber windows automatically
        set-option -g renumber-windows on

        # Vim style pane selection
        bind h select-pane -L
        bind j select-pane -D
        bind k select-pane -U
        bind l select-pane -R

        # Use Alt-arrow keys without prefix key to switch panes
        bind -n M-Left select-pane -L
        bind -n M-Right select-pane -R
        bind -n M-Up select-pane -U
        bind -n M-Down select-pane -D

        # Shift arrow to switch windows
        bind -n S-Left  previous-window
        bind -n S-Right next-window

        # Shift Alt vim keys to switch windows
        bind -n M-H previous-window
        bind -n M-L next-window

        # Vi mode keybindings for copy mode
        bind-key -T copy-mode-vi v send-keys -X begin-selection
        bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
        bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel

        # Split windows in current directory
        bind '"' split-window -v -c "#{pane_current_path}"
        bind % split-window -h -c "#{pane_current_path}"

        # Ensure CTRL+L works for clearing screen
        bind -n C-l send-keys C-l
      '';
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
  };
}
