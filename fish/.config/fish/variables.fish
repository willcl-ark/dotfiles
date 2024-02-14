set -gx BASH (command -v bash)
if [ (uname) = Darwin ]
    set -gx BDB_PREFIX /Users/will/src/bitcoin/depends/x86_64-apple-darwin22.2.0
else if [ (uname) = Linux ]
    set -gx BDB_PREFIX $HOME/src/bitcoin/db4
    # Pick up system packages using linuxbrew pkg-config
    set -gx PKG_CONFIG_PATH /usr/lib/x86_64-linux-gnu/pkgconfig/
end
set -gx BUILD_CMD "bear -- make"
set -gx CC (command -v clang)
set -gx CCACHE_DIR $HOME/.ccache
set -gx CMAKE_EXPORT_COMPILE_COMMANDS 1
set -gx CHEAT_USE_FZF true
set -gx CXX (command -v clang++)
set -gx DARK 1
set -gx DELTA_PAGER less -R
set -gx DETACHED_SIGS_REPO $HOME/src/bitcoin-detached-sigs
set -gx EDITOR nvim
set -gx FZF_DEFAULT_COMMAND 'fd --type file --color=always'
set -gx FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
set -gx FZF_DEFAULT_OPTS "$FZF_DEFAULT_OPTS  --color fg:#ebdbb2,bg:#282828,hl:#fabd2f,fg+:#ebdbb2,bg+:#3c3836,hl+:#fabd2f
  --color info:#83a598,prompt:#bdae93,spinner:#fabd2f,pointer:#83a598,marker:#fe8019,header:#665c54"
set -gx GEM_HOME $HOME/.gems
set -gx GEM_BIN $GEM_HOME/bin
set -gx GPG_TTY (tty)
set -gx GUIX_LOCPATH $HOME/.guix-profile/lib/locale
set -gx GUIX_SIGS_REPO $HOME/src/guix.sigs
set -gx MANPATH $HOME/.nvm/versions/node/v16.13.1/share/man $HOME/.npm-packages/share/man /usr/man /usr/share/man /usr/local/man /usr/local/share/man /usr/X11R6/man /opt/man /snap/man
set -gx NPM_PACKAGES $HOME/.npm-packages
set -gx NVM_DIR $HOME/.nvm
set -gx NVIM_PYTHON $HOME/.pyenv/versions/neovim2/bin/python
set -gx NVIM_PYTHON3 $HOME/.pyenv/versions/neovim3/bin/python
set -gx PIP_REQUIRE_VIRTUALENV 0
# Hack for poetry: https://github.com/python-poetry/poetry/issues/1917#issuecomment-1235998997
set -gx PYTHON_KEYRING_BACKEND keyring.backends.null.Keyring
set -gx RIPGREP_CONFIG_PATH $HOME/.config/ripgrep/ripgreprc
set -gx SIGNER 0xCE6EC49945C17EA6=willcl-ark
set -gx SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
set -gx VIRTUALFISH_DEFAULT_PYTHON (command -v python3)
set -gx VISUAL nvim
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_DATA_HOME $HOME/.local/share
set -gx XDG_STATE_HOME $HOME/.local/state

# This fixed my flatpak firefox install on Ubuntu
if [ (uname) = Linux ]
    set -gx DXG_DATA_DIRS /usr/share/ubuntu:/home/will/.local/share/flatpak/exports/share:/var/lib/flatpak/exports/share:/usr/local/share:/usr/share:/var/lib/snapd/desktop
end

