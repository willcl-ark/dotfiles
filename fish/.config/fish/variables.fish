set -gx BASH (command -v bash)
set -gx BDB_PREFIX $HOME/src/bitcoin/db4
set -gx CC (command -v clang)
set -gx CCACHE_DIR $HOME/.ccache
set -gx CHEAT_USE_FZF true
set -gx CXX (command -v clang++)
set -gx CXXFLAGS "-Wno-suggest-override"
set -gx DARK 1
set -gx DETACHED_SIGS_REPO $HOME/src/bitcoin-detached-sigs
set -gx EDITOR nvim
set -gx GEM_HOME $HOME/.gems
set -gx GEM_BIN $GEM_HOME/bin
set -gx GUIX_LOCPATH $HOME/.guixprofile/lib/locale
set -gx GUIX_SIGS_REPO $HOME/src/guix.sigs
set -gx MANPATH $HOME/.nvm/versions/node/v16.13.1/share/man $HOME/.npm-packages/share/man /usr/man /usr/share/man /usr/local/man /usr/local/share/man /usr/X11R6/man /opt/man /snap/man
set -gx NPM_PACKAGES $HOME/.npm-packages
set -gx NVM_DIR $HOME/.nvm
set -gx PIP_REQUIRE_VIRTUALENV 0
# Hack for poetry: https://github.com/python-poetry/poetry/issues/1917#issuecomment-1235998997
set -gx PYTHON_KEYRING_BACKEND keyring.backends.null.Keyring
set -gx RIPGREP_CONFIG_PATH $HOME/.config/ripgrep/ripgreprc
set -gx SIGNER will8clark
set -gx SSH_AUTH_SOCK /run/user/1000/gnupg/S.gpg-agent.ssh
set -gx VIRTUALFISH_DEFAULT_PYTHON (command -v python3)
set -gx VISUAL nvim
set -gx XDG_CONFIG_HOME $HOME/.config
