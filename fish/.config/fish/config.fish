source $HOME/.config/fish/paths.fish
source $HOME/.config/fish/variables.fish
source $HOME/.config/fish/abbreviations.fish

# pyenv
#status is-login; and pyenv init --path | source
#status is-interactive; and pyenv init - fish | source
# speeded up by
# https://posts.michaelks.org/instant-pyenv-rbenv-startup-times-with-tmux/
if status is-login
    pyenv init - --no-rehash fish | source
    and funcsave pyenv &> /dev/null
    and sh -c 'command pyenv rehash 2>/dev/null &'
end

# Use vim keybindings in fish editor
fish_vi_key_bindings

starship init fish | source

