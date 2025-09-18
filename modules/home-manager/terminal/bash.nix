{
  lib,
  pkgs,
  config,
  ...
}:
{

  options.terminal.bash.enable = lib.mkEnableOption "Enable bash";

  config = lib.mkIf config.terminal.bash.enable {
    programs.bash = {
      enable = true;
      shellAliases = {
        rebuild = "sudo nixos-rebuild switch --flake github:kajjagtenberg/nixos --refresh";
        ga = "git add .";
        gc = "git commit -m ";
        gp = "git push";
        ls = "eza";
        ll = "ls -lha";
        cat = "bat --style=plain --theme=base16 --paging=never ";
        ".." = "cd ..";
      };
      bashrcExtra = ''
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

        eval "$(starship init bash)"
        eval "$(zoxide init bash)"
      '';
    };
  };
}
