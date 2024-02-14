function bworktree

    if test (basename (pwd)) != bitcoin
        echo "Error: Must be in bitcoin directory"
        return 1
    end

    set -l PR_NUMBER $argv[1]

    if test -z "$PR_NUMBER"
        echo "Usage: fetch_pr [pull-number]"
        return 1
    end

    set -l WORKTREE_DIR $HOME/src/bitcoin-$PR_NUMBER

    if test -d "$WORKTREE_DIR"
        echo "Worktree $WORKTREE_DIR already exists"
        return 1
    end


    echo "Fetching PR $PR_NUMBER from upstream..."
    gh pr checkout $PR_NUMBER

    set -l BRANCH_NAME (git rev-parse --abbrev-ref HEAD)
    echo "Got PR $PR_BRANCH, $BRANCH_NAME from upstream"

    git switch master
    git worktree add $WORKTREE_DIR $BRANCH_NAME

    cp .python-version pyproject.toml .gdbinit .envrc $WORKTREE_DIR
    cd $WORKTREE_DIR
    direnv allow .

end
