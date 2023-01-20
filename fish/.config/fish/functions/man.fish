

function man --description "wrap the 'man' manual page opener to use color in formatting"
  # based on this group of settings and explanation for them:
  # http://boredzo.org/blog/archives/2016-08-15/colorized-man-pages-understood-and-customized
  # converted to Fish shell syntax thanks to this page:
  # http://askubuntu.com/questions/522599/how-to-get-color-man-pages-under-fish-shell/650192

  set -x LESS_TERMCAP_mb \e'[01;31m'       # begin blinking
  set -x LESS_TERMCAP_md \e'[01;38;5;74m'  # begin bold
  set -x LESS_TERMCAP_me \e'[0m'           # end mode
  set -x LESS_TERMCAP_se \e'[0m'           # end standout-mode
  set -x LESS_TERMCAP_so \e'[38;5;246m'    # begin standout-mode - info box
  set -x LESS_TERMCAP_ue \e'[0m'           # end underline
  set -x LESS_TERMCAP_us \e'[04;38;5;146m' # begin underline

  command man $argv
end
