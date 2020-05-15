# pyenv
set -x PYENV_ROOT $HOME/.pyenv
status --is-interactive; and source (pyenv init -|psub)
# status --is-interactive; and source (pyenv virtualenv-init -|psub)

# Python/PIP
set -x PIP_REQUIRE_VIRTUALENV 1

# Spacefish
set -x SPACEFISH_PROMPT_ORDER time user dir host git rust pyenv exec_time jobs exit_code char
set -x SPACEFISH_PROMPT_ADD_NEWLINE false
set -x SPACEFISH_PROMPT_SEPARATE_LINE false
set -x SPACEFISH_USER_SHOW always


# Colored man pages: http://linuxtidbits.wordpress.com/2009/03/23/less-colors-for-man-pages/
# https://stackoverflow.com/questions/34265221/how-to-colorize-man-page-in-fish-shell
# Less Colors for Man Pages
#set -gx LESS_TERMCAP_mb \e'[01;31m'       # begin blinking
#set -gx LESS_TERMCAP_md \e'[01;38;5;74m'  # begin bold
#set -gx LESS_TERMCAP_me \e'[0m'           # end mode
#set -gx LESS_TERMCAP_se \e'[0m'           # end standout-mode
#set -gx LESS_TERMCAP_so \e'[38;5;016m'    # begin standout-mode - info box
#set -gx LESS_TERMCAP_ue \e'[0m'           # end underline
#set -gx LESS_TERMCAP_us \e'[04;38;5;146m' # begin underline
