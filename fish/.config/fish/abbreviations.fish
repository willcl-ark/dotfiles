abbr -a -g -- bcli bitcoin-cli
abbr -a -g -- cheat cht.sh
abbr -a -g -- check-links find\ .\ -name\ \\\*.adoc\ -exec\ asciidoc-link-check\ -p\ \{\}\ \\\;
abbr -a -g -- electrumtunnel 'ssh nucremote -L 50001:localhost:50001 -N'
abbr -a -g -- fetch-master 'git checkout master; and git fetch --all --tags --prune; and git merge upstream/master'
abbr -a -g -- fd 'fd -uu'
abbr -a -g -- genesis-block 'bitcoin-cli getblockhash 0 | xargs -I {} bitcoin-cli getblock {} 0 | xxd -r -p | hexdump -v -C'
abbr -a -g -- gg 'git grep -i'
abbr -a -g -- grc 'git rebase --continue'
abbr -a -g -- htop 'TERM=xterm-256color htop'
abbr -a -g -- icdiff 'icdiff --no-bold'
abbr -a -g -- imap 'PYENV_VERSION=offlineimap offlineimap'
abbr -a -g -- k 'kubectl'
abbr -a -g -- lcli lightning-cli
abbr -a -g -- ll 'eza -al'
abbr -a -g -- lld 'eza -s modified -rl'
abbr -a -g -- llo 'eza -al -s newest'
abbr -a -g -- ls eza
abbr -a -g -- lslm 'ls -aFlhpt'
abbr -a -g -- lss 'ls -aFlhS'
abbr -a -g -- make-check 'bear -- make -j16; and make -j16 check'
abbr -a -g -- make-clean 'make clean; and rm compile_commands.json; and bear -- make -j16'
abbr -a -g -- make-lint 'bear -- make -j16; and and ./test/lint/all-lint.py'
abbr -a -g -- make-lint-check 'bear -- make -j16; and ./test/lint/all-lint.py; and make -j16 check'
abbr -a -g -- make-lint-check-test 'bear -- make -j16; and ./test/lint/all-lint.py; and make -j16 check; test/functional/test_runner.py --jobs=32 --cachedir=/mnt/tmp/cache --tmpdir=/mnt/tmp'
abbr -a -g -- mvc 'mullvad connect'
abbr -a -g -- mvd 'mullvad disconnect'
abbr -a -g -- mutt 'pushd $HOME/Downloads/; source ~/.venv/bin/activate.fish; TERM=alacritty-direct  neomutt; popd; deactivate'
abbr -a -g -- myip 'curl ifconfig.me'
abbr -a -g -- notify 'say finished'
abbr -a -g -- pa 'source .venv/bin/activate.fish'
abbr -a -g -- pd 'deactivate'
abbr -a -g -- pip 'uv pip'
abbr -a -g -- print-user-path echo\ \$fish_user_paths\ \|\ tr\ \"\ \"\ \"\\n\"\ \|\ nl
abbr -a -g -- rb bear -- make -j16
abbr -a -g -- rcli 'bitcoin-cli -regtest'
abbr -a -g -- rm 'rm -i'
abbr -a -g -- speedtest-curl 'curl -o /dev/null http://ipv4.download.thinkbroadband.com/1GB.zip'
abbr -a -g -- tb 'nc termbin.com 9999'
abbr -a -g -- tbcli $HOME/src/bitcoin/src/bitcoin-cli
abbr -a -g -- tbitcoin-qt $HOME/src/bitcoin/src/qt/bitcoin-qt
abbr -a -g -- tbitcoind $HOME/src/bitcoin/src/bitcoind
abbr -a -g -- tbwallet $HOME/src/bitcoin/src/bitcoin-wallet
abbr -a -g -- todo nvim ~/todo.txt
abbr -a -g -- update-ytdl sudo\ curl\ -L\ https://yt-dl.org/downloads/latest/youtube-dl\ -o\ /usr/local/bin/youtube-dl\nsudo\ chmod\ a+rx\ /usr/local/bin/youtube-dl
abbr -a -g -- vim nvim
abbr -a -g -- wasabitunnel 'ssh nucremote -L 8333:localhost:8333 -N'
abbr -a -g -- weather curl\ wttr.in/Frome\\\?format=v2\ \&\&\ curl\ wttr.in/Frome
abbr -a -g -- which 'command -v'
abbr -a -g -- youtube-dl-best 'youtube-dl -f bestvideo+bestaudio --merge-output-format mkv'
abbr -a -g -- ytdl-audio 'youtube-dl -x --audio-format best'
abbr -a -g -- ytdl-list 'youtube-dl -F'
abbr -a -g -- xsel 'xsel -b'
