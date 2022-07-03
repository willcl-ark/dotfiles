function show-last-git-commit
    for dir in (fd --type d --maxdepth 1)
        pushd $dir
        echo "---------------------------"
        echo (basename $PWD)
        git fetch origin > /dev/null
        #set --local branch_cur (git branch --show-current)
        #set --local branch_best (git for-each-ref --count=1 --sort=-committerdate --format='%(refname:short)')
        #if [ $branch_cur != $branch_best ]
        #    git switch --track $branch_best > /dev/null
        #end
        #git pull > /dev/null
        #git log HEAD -1 | rg --regexp '^.*(Author|Date).*$' | tee
        
        # git show --pretty=short (git rev-list --all | head -1)

        git fetch && git for-each-ref --sort=-committerdate --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))' --color=always | head -n 1
        git shortlog -s -n --all --no-merges
        popd
    end
    echo "---------------------------"
end
