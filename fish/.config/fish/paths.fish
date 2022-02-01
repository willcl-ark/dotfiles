set -g fish_user_paths
fish_add_path $HOME/.local/share/gem/ruby/2.7.0/bin 
fish_add_path $HOME/.npm-packages/bin 
if [ (uname) = Linux ]
    fish_add_path /home/linuxbrew/.linuxbrew/bin 
end
fish_add_path $HOME/.local/bin 
fish_add_path $HOME/.fzf/bin
fish_add_path $HOME/go/bin 
fish_add_path /usr/local/go/bin 
fish_add_path $HOME/.pyenv/bin 
fish_add_path $HOME/.cargo/bin 
fish_add_path $HOME/neovim/bin 
