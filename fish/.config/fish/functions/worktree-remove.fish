function worktree-remove
    set -l branch_name (basename $argv[1])
    set -l worktree_path $HOME/src/worktrees/$branch_name

    for file in (core-symlinked-files)
        set -l target $worktree_path/(basename $file)
        if test -L $target
            rm $target
        end
    end

    git worktree remove $worktree_path

    echo "Worktree at $worktree_path removed and symlinks deleted."

end
