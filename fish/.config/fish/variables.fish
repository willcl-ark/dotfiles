set -gx BASH (command -v bash)
set -gx CC (command -v clang)
set -gx CCACHE_DIR $HOME/.ccache
set -gx CMAKE_EXPORT_COMPILE_COMMANDS 1
set -gx CXX (command -v clang++)
set -gx DARK 1
set -gx DELTA_PAGER less -R
set -gx DETACHED_SIGS_REPO $HOME/src/bitcoin-detached-sigs
set -gx EDITOR nvim
set -gx FZF_DEFAULT_COMMAND 'fd --type file --color=always'
set -gx FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
set -gx FZF_DEFAULT_OPTS "$FZF_DEFAULT_OPTS  --color fg:#ebdbb2,bg:#282828,hl:#fabd2f,fg+:#ebdbb2,bg+:#3c3836,hl+:#fabd2f
  --color info:#83a598,prompt:#bdae93,spinner:#fabd2f,pointer:#83a598,marker:#fe8019,header:#665c54"
set -gx fzf_fd_opts --hidden --max-depth 5
set -gx GPG_TTY (tty)
set -gx GUIX_LOCPATH $HOME/.guix-profile/lib/locale
set -gx GUIX_SIGS_REPO $HOME/src/guix.sigs
set -gx MANPAGER "nvim +Man!"
set -gx HOMEBREW_NO_AUTO_UPDATE 1
set -gx PIP_REQUIRE_VIRTUALENV 0
set -gx RIPGREP_CONFIG_PATH $HOME/.config/ripgrep/ripgreprc
set -gx SIGNER 0xCE6EC49945C17EA6=willcl-ark
set -gx VISUAL nvim
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_DATA_HOME $HOME/.local/share
set -gx XDG_STATE_HOME $HOME/.local/state
