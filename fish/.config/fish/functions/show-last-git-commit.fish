function show-last-git-commit
    for dir in (fd --type d --maxdepth 1)
        pushd $dir
        echo "---------------------------"
        # checkout the most-recently-updated branch
        git fetch --all --tags --prune > /dev/null
        set --local cur_branch (git branch | head -n 1 | sed 's/[^ ]* //')
        set --local best_branch (git branch --sort=-committerdate | head -n 1 | sed 's/[^ ]* //')
        if [ $cur_branch != $best_branch ]
            git checkout $best_branch > /dev/null
        end
        git pull > /dev/null
        git log HEAD -1 | rg --regexp '^.*(Author|Date).*$' | tee
        popd
    end
    echo "---------------------------"
end
