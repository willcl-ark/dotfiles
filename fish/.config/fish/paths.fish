# paths added later will be PREPENDED to current path
# Add paths to the bottom to have them appear first

set -g fish_user_paths

fish_add_path $HOME/.npm-packages/bin
fish_add_path $HOME/.gems/bin
if [ (uname) = Linux ]
    fish_add_path /home/linuxbrew/.linuxbrew/bin
    fish_add_path /var/lib/flatpak/exports/bin
end
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.fzf/bin
fish_add_path $HOME/go/bin
fish_add_path /usr/local/go/bin
fish_add_path $HOME/.pyenv/bin
fish_add_path $HOME/.cargo/bin
# fish_add_path (rustup which rust-analyzer | rev | cut -d "/" -f2- | rev)
if [ (uname) = Linux ]
    fish_add_path /usr/local/zig
    fish_add_path /usr/lib/ccache
    fish_add_path $HOME/src/FlameGraph
end
# homebrew and brew bins
if [ (uname) = Darwin ]
    fish_add_path /opt/homebrew/bin/
    fish_add_path /usr/local/bin
    fish_add_path /opt/homebrew/opt/llvm/bin
    fish_add_path /opt/homebrew/opt/ccache/libexec
end
