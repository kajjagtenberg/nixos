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
    home.packages = with pkgs; [
      alejandra
    ];

    programs.bash = {
      enable = true;
      shellAliases = {
        # rebuild = "rebuild_system";
        rebuild = "sudo nixos-rebuild switch --flake github:kajjagtenberg/nixos --refresh";
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
          rebuild_system() {
            set -e

            # Edit your config
            $EDITOR configuration.nix

            # cd to your config dir
            pushd ~/nixos/

            # Early return if no changes were detected
            if git diff --quiet '*.nix'; then
                echo "No changes detected, exiting."
                popd
                exit 0
            fi

            # Autoformat your nix files
            alejandra . &>/dev/null \
              || ( alejandra . ; echo "formatting failed!" && exit 1)

            # Shows your changes
            git diff -U0 '*.nix'

            echo "NixOS Rebuilding..."

            # Rebuild, output simplified errors, log trackebacks
            sudo nixos-rebuild switch &>nixos-switch.log || (cat nixos-switch.log | grep --color error && exit 1)

            # Get current generation metadata
            current=$(nixos-rebuild list-generations | grep current)

            # Commit all changes witih the generation metadata
            git commit -am "$current"

            # Back to where you were
            popd
          }
        ''
      ];
    };
  };
}
