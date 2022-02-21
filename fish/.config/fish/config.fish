source $HOME/.config/fish/paths.fish

# pyenv
status is-interactive; and pyenv init --path | source

# Coloured man output
# from http://linuxtidbits.wordpress.com/2009/03/23/less-colors-for-man-pages/
setenv LESS_TERMCAP_mb \e'[01;31m'       # begin blinking
setenv LESS_TERMCAP_md \e'[01;38;5;74m'  # begin bold
setenv LESS_TERMCAP_me \e'[0m'           # end mode
setenv LESS_TERMCAP_se \e'[0m'           # end standout-mode
setenv LESS_TERMCAP_so \e'[38;5;246m'    # begin standout-mode - info box
setenv LESS_TERMCAP_ue \e'[0m'           # end underline
setenv LESS_TERMCAP_us \e'[04;38;5;146m' # begin underline

function fish_prompt
	set_color yellow
	echo -n "["(date "+%H:%M")"] "
	set_color blue
	echo -n (hostname)
	if [ $PWD != $HOME ]
		set_color brblack
		echo -n ':'
		set_color yellow
		echo -n (basename $PWD)
	end
	set_color green
	printf '%s ' (__fish_git_prompt)
	set_color red
	echo -n '| '
	set_color f2a900
    echo -n '₿ '
    set color normal
end

function fish_greeting
	echo
	echo -e (uname -r | awk '{print " \\\\e[1mOS: \\\\e[0;32m"$0"\\\\e[0m"}')
	echo -e (uptime | sed 's/^up //' | awk '{print " \\\\e[1mUptime: \\\\e[0;32m"$0"\\\\e[0m"}')
	echo -e (uname -n | awk '{print " \\\\e[1mHostname: \\\\e[0;32m"$0"\\\\e[0m"}')
    if [ (uname) = Linux ]
        echo -e " \\e[1mDisk usage:\\e[0m"
        echo
        echo -ne (\
            df -l -h | grep -E 'dev/mapper' | \
            awk '{printf "\\\\t%s\\\\t%4s / %4s  %s\\\\n\n", $6, $3, $2, $5}' | \
            sed -e 's/^\(.*\([8][5-9]\|[9][0-9]\)%.*\)$/\\\\e[0;31m\1\\\\e[0m/' -e 's/^\(.*\([7][5-9]\|[8][0-4]\)%.*\)$/\\\\e[0;33m\1\\\\e[0m/' | \
            paste -sd ''\
        )
        echo

        echo -e " \\e[1mNetwork:\\e[0m"
        echo
        # http://tdt.rocks/linux_network_interface_naming.html
        echo -ne (\
            ip addr show up scope global | \
                grep -E ': <|inet' | \
                sed \
                    -e 's/^[[:digit:]]\+: //' \
                    -e 's/: <.*//' \
                    -e 's/.*inet[[:digit:]]* //' \
                    -e 's/\/.*//'| \
                awk 'BEGIN {i=""} /\.|:/ {print i" "$0"\\\n"; next} // {i = $0}' | \
                sort | \
                column -t -R1 | \
                # public addresses are underlined for visibility \
                sed 's/ \([^ ]\+\)$/ \\\e[4m\1/' | \
                # private addresses are not \
                sed 's/m\(\(10\.\|172\.\(1[6-9]\|2[0-9]\|3[01]\)\|192\.168\.\).*\)/m\\\e[24m\1/' | \
                # unknown interfaces are cyan \
                sed 's/^\( *[^ ]\+\)/\\\e[36m\1/' | \
                # ethernet interfaces are normal \
                sed 's/\(\(en\|em\|eth\)[^ ]* .*\)/\\\e[39m\1/' | \
                # wireless interfaces are purple \
                sed 's/\(wl[^ ]* .*\)/\\\e[35m\1/' | \
                # wwan interfaces are yellow \
                sed 's/\(ww[^ ]* .*\).*/\\\e[33m\1/' | \
                sed 's/$/\\\e[0m/' | \
                sed 's/^/\t/' \
            )
    end
    echo
end

# Use vim keybindings in fish editor
#fish_vi_key_bindings

# NPM / NVM
if [ (uname) = Linux ]
    nvm use node > /dev/null
end

