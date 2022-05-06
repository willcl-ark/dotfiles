function show-last-git-commit
    for dir in (fd --type d --maxdepth 1)
        pushd $dir
        echo "---------------------------"
        git fetch --all > /dev/null
        # Coul use `git branch --show-current` here too?
        set --local branch_cur (git rev-parse --abbrev-ref HEAD)
        set --local branch_best (git for-each-ref --count=1 --sort=-committerdate refs/heads/ --format='%(refname:short)')
        if [ $branch_cur != $branch_best ]
            git switch $best_branch > /dev/null
        end
        git pull > /dev/null
        git log HEAD -1 | rg --regexp '^.*(Author|Date).*$' | tee
        popd
    end
    echo "---------------------------"
end
