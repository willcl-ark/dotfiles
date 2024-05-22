function worktree-add
    set -l branch_name (basename $argv[1])
    set -l worktree_path $HOME/src/worktrees/$branch_name

    if test (count $argv) -eq 2
        git worktree add $worktree_path $argv[2]
    else
        git worktree add $worktree_path
    end

    for file in (core-symlinked-files)
        ln -s $file $worktree_path/(basename $file)
    end
    direnv allow

    echo "Worktree created at $worktree_path and symlinks added."

end
