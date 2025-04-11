# paths added later will be PREPENDED to current path
# Add paths to the bottom to have them appear first

set -g fish_user_paths

fish_add_path $HOME/.local/bin
fish_add_path $HOME/go/bin
fish_add_path /usr/local/go/bin
fish_add_path $HOME/.cargo/bin
# homebrew and brew bins
if [ (uname) = Darwin ]
    fish_add_path /usr/local/bin
    fish_add_path /usr/local/opt/llvm/bin
    fish_add_path /usr/local/opt/ccache/libexec
end
