{
  lib,
  pkgs,
  config,
  ...
}:
{

  options.terminal.bash.enable = lib.mkEnableOption "Enable bash" // {
    default = true;
  };

  config = lib.mkIf config.terminal.bash.enable {
    programs.bash = {
      enable = true;
      shellAliases = {
        rebuild = "rebuild_system";
        ga = "git add .";
        gc = "git commit -m ";
        gp = "git push";
        ls = "eza";
        ll = "ls -lha";
        cat = "bat --style=plain --theme=base16 --paging=never ";
        ".." = "cd ..";
        t = "tmux";
        ta = "tmux a";
        lg = "lazygit";
        weather = "curl wttr.in/amersfoort";
      };
      bashrcExtra = lib.mkMerge [
        (lib.mkIf config.dev.neovim.enable ''
          # --- Scratchpad Neovim (Ctrl+n) ---
          open_nvim_scratchpad() {
            nvim
          }
          bind -x '"\C-n":open_nvim_scratchpad'

          # --- Edit current command buffer in Neovim (Ctrl+o) ---
          export EDITOR=nvim
          export VISUAL=nvim
          bind '"\C-o": edit-and-execute-command'

          # Fuzzy search previous command output
          fzf_last_output() {
            # Re-run the last command, capture output, pipe to fzf
            fc -nl -1 | bash | fzf
          }

          # Bind it to Ctrl+f
          bind -x '"\C-f":fzf_last_output'
        '')
        (lib.mkIf config.terminal.tools.enable ''
          eval "$(starship init bash)"
          eval "$(zoxide init bash)"
        '')
        ''
          # Enhanced rebuild function with progress indicator
          rebuild_system() {
            echo "🔄 Starting NixOS rebuild..."
            local spinner="/-\|"
            local i=0
            local log_file="/tmp/nixos-rebuild.log"

            # Start rebuild in background
            sudo nixos-rebuild switch --flake github:kajjagtenberg/nixos --refresh > "$log_file" 2>&1 &
            local pid=$!

            # Show spinner while rebuild is running
            while kill -0 $pid 2>/dev/null; do
              printf "\r%s Rebuilding system..." "''${spinner:$i:1}"
              i=$(( (i+1) % 4 ))
              sleep 0.2
            done

            # Check if rebuild was successful
            if wait $pid; then
              printf "\r✅ Rebuild completed successfully!\n"
            else
              printf "\r❌ Rebuild failed!\n"
              echo "📄 Here's the error output:"
              echo "----------------------------------------"
              cat "$log_file"
              echo "----------------------------------------"
              return 1
            fi
          }
        ''
      ];
    };
  };
}
