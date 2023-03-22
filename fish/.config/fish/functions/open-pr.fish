function open-pr
    set --local PR (git log --merges --reverse --oneline --ancestry-path $argv[1]..upstream | head -n 1 | cut -d " " -f 3 | grep -o '[0-9]\+')
    xdg-open "https://github.com/bitcoin/bitcoin/pull/$PR"
end
