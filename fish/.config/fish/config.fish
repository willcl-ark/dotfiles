source "$HOME/.config/fish/paths.fish"
source "$HOME/.config/fish/variables.fish"
source "$HOME/.config/fish/abbreviations.fish"
source "$HOME/.config/fish/secret.fish"

# Use vim keybindings in fish editor
fish_vi_key_bindings

starship init fish | source
zoxide init --cmd cd fish | source
direnv hook fish | source

fzf_configure_bindings --directory=\cf --git_log=\cg --git_status=\cs --history=\cr --variables=\cv
