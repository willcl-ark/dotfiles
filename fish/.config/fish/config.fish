source $HOME/.config/fish/paths.fish
source $HOME/.config/fish/variables.fish
source $HOME/.config/fish/abbreviations.fish

# pyenv
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
zoxide init --cmd cd fish | source
direnv hook fish | source

fzf_configure_bindings --directory=\cf --git_log=\cg --git_status=\cs --history=\cr --variables=\cv
