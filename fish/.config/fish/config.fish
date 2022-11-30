source $HOME/.config/fish/paths.fish
source $HOME/.config/fish/variables.fish

# pyenv
status is-login; and pyenv init --path | source
status is-interactive; and pyenv init - | source


# Coloured man output
# from http://linuxtidbits.wordpress.com/2009/03/23/less-colors-for-man-pages/
setenv LESS_TERMCAP_mb \e'[01;31m'       # begin blinking
setenv LESS_TERMCAP_md \e'[01;38;5;74m'  # begin bold
setenv LESS_TERMCAP_me \e'[0m'           # end mode
setenv LESS_TERMCAP_se \e'[0m'           # end standout-mode
setenv LESS_TERMCAP_so \e'[38;5;246m'    # begin standout-mode - info box
setenv LESS_TERMCAP_ue \e'[0m'           # end underline
setenv LESS_TERMCAP_us \e'[04;38;5;146m' # begin underline

# Use vim keybindings in fish editor
fish_vi_key_bindings

# NPM / NVM
if [ (uname) = Linux ]
    nvm use node > /dev/null
end

starship init fish | source

