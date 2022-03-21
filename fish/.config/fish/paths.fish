# paths added later will be PREPENDED to current path
# Add paths to the bottom to have them appear first

# This fixed my flatpak firefox install on Ubuntu
if [ (uname) = Linux ]
    set -gx DXG_DATA_DIRS /usr/share/ubuntu:/home/will/.local/share/flatpak/exports/share:/var/lib/flatpak/exports/share:/usr/local/share:/usr/share:/var/lib/snapd/desktop
end

set -g fish_user_paths

fish_add_path $HOME/.npm-packages/bin 
fish_add_path $HOME/.gems/bin
if [ (uname) = Linux ]
    fish_add_path /home/linuxbrew/.linuxbrew/bin 
end
fish_add_path $HOME/.local/bin 
fish_add_path $HOME/.fzf/bin
fish_add_path $HOME/go/bin 
fish_add_path /usr/local/go/bin 
fish_add_path $HOME/.pyenv/bin 
fish_add_path $HOME/.cargo/bin 
fish_add_path /usr/lib/ccache
# homebrew
if [ (uname) = Darwin ]
    fish_add_path /usr/local/bin
end
fish_add_path $HOME/neovim/bin 
