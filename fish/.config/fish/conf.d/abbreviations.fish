abbr -a -g -- add 'llo exa -al -s oldest'
abbr -a -g -- bcli bitcoin-cli
abbr -a -g -- check-links find\ .\ -name\ \\\*.adoc\ -exec\ asciidoc-link-check\ -p\ \{\}\ \\\;
abbr -a -g -- electrumtunnel 'ssh nucremote -L 50001:localhost:50001 -N'
abbr -a -g -- genesis-block 'bitcoin-cli getblockhash 0 | xargs -I {} bitcoin-cli getblock {} 0 | xxd -r -p | hexdump -v -C'
abbr -a -g -- gg 'git grep -i'
abbr -a -g -- grc 'git rebase --continue'
abbr -a -g -- htop 'TERM=xterm-256color htop'
abbr -a -g -- icdiff 'icdiff --no-bold'
abbr -a -g -- imap 'PYENV_VERSION=offlineimap offlineimap'
abbr -a -g -- lcli lightning-cli
abbr -a -g -- ll 'exa -al'
abbr -a -g -- lld 'exa -s modified -rl'
abbr -a -g -- llo 'exa -al -s oldest'
abbr -a -g -- ls exa
abbr -a -g -- lslm 'ls -aFlhpt'
abbr -a -g -- lss 'ls -aFlhS'
abbr -a -g -- mutt 'pushd $HOME/Downloads/; TERM=screen-256color neomutt; popd'
abbr -a -g -- myip 'curl ifconfig.me'
abbr -a -g -- notify 'say finished'
abbr -a -g -- print-user-path echo\ \$fish_user_paths\ \|\ tr\ \"\ \"\ \"\\n\"\ \|\ nl
abbr -a -g -- rcli 'bitcoin-cli -regtest'
abbr -a -g -- rm 'rm -i'
abbr -a -g -- speedtest-curl 'curl -o /dev/null http://ipv4.download.thinkbroadband.com/1GB.zip'
abbr -a -g -- tb 'nc termbin.com 9999'
abbr -a -g -- tcli 'bitcoin-cli -testnet'
abbr -a -g -- update-ytdl sudo\ curl\ -L\ https://yt-dl.org/downloads/latest/youtube-dl\ -o\ /usr/local/bin/youtube-dl\nsudo\ chmod\ a+rx\ /usr/local/bin/youtube-dl
abbr -a -g -- vim nvim
abbr -a -g -- wasabitunnel 'ssh nucremote -L 8333:localhost:8333 -N'
abbr -a -g -- weather curl\ wttr.in/Frome\\\?format=v2\ \&\&\ curl\ wttr.in/Frome
abbr -a -g -- which 'command -v'
abbr -a -g -- youtube-dl-best 'youtube-dl -f bestvideo+bestaudio --merge-output-format mkv'
abbr -a -g -- ytdl-audio 'youtube-dl -x --audio-format best'
abbr -a -g -- ytdl-list 'youtube-dl -F'
