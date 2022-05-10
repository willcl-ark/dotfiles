function show-last-git-commit
    for dir in (fd --type d --maxdepth 1)
        pushd $dir
        echo "---------------------------"
        echo (basename $PWD)
        git fetch --all > /dev/null
        set --local branch_cur (git branch --show-current)
        set --local branch_best (git for-each-ref --count=1 --sort=-committerdate --format='%(refname:short)')
        if [ $branch_cur != $branch_best ]
            git switch --track $branch_best > /dev/null
        end
        git pull > /dev/null
        git log HEAD -1 | rg --regexp '^.*(Author|Date).*$' | tee
        popd
    end
    echo "---------------------------"
end
