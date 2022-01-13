function compare-git-tip
    git checkout master
    git fetch --all --tags -f --prune

    set LOCAL (git rev-parse @)
    set REMOTE (git rev-parse @{u})
    set BASE (git merge-base @ @{u})

    if test $LOCAL = $REMOTE
        set_color green
        echo "Working branch is up-to-date with remote master, already up to date"
        set_color normal
        return 1
    else if test $LOCAL = $BASE
        set_color yellow
        echo "Your working branch is behind the remote branch, running: git pull"
        set_color normal
        git pull
        return 0
    else if test $REMOTE = $BASE
        set_color red
        echo "Your working branch is ahead of the remote branch, you need to run:\ngit push origin master"
        set_color normal
        return 1
    else
        set_color red
        echo "Your working branch has diverged from the remote master, cannot continue"
        set_color normal
        return 1
    end
end
