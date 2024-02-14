function pr-tree
    set --local BASE_DIR (path dirname $PWD)
    set --local WT_DIR "$BASE_DIR/bitcoin-$argv[1]"

    # Check if the specified pull request number is valid
    set pr_status (gh pr view $argv[1] >/dev/null; echo $status)
    if test $pr_status -ne 0
        echo "Error: Invalid pull request number '$argv[1]'."
        return
    end

    # Create the worktree for the pull request
    # needs https://github.com/despreston/gh-worktree
    gh worktree pr $argv[1] "$WT_DIR"
    if test $status -ne 0
        echo "Error: Failed to create worktree for pull request '$argv[1]'."
        return
    end

    # Change directory to the worktree
    cd $WT_DIR
end

