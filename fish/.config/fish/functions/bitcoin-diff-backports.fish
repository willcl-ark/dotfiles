function bitcoin-diff-backports
    argparse "h/help" "b/base-branch=" -- $argv
    or return 1

    if set -ql _flag_help
        echo ""
        echo "Usage: bitcoin-diff-backports --base-branch=<base-branch>"
        echo "  e.g. bitcoin-diff-backports --base-branch=\"upstream/25.x\""
        echo ""
        echo "Diff between commits in current branch and their 'Rebased-From' counterparts in <base-branch>."
        return 0
    end

    # Check if base branch argument is given
    if not set -ql _flag_base_branch
        echo "Error: Missing required --base-branch argument."
        echo "Run 'bitcoin-diff-backports --help' for usage information."
        return 1
    end

    # Capture the base branch from the flag
    set --local base_branch $_flag_base_branch

    # Find the merge base
    set --local merge_base (git merge-base HEAD $base_branch)
    set --local tmpdir /tmp/bitcoin-rebase
    mkdir --parents $tmpdir

    # Iterate over each commit from HEAD to merge-base
    for commit_hash in (git rev-list $merge_base..HEAD)
        # Extract the "Rebased-From" hash from the commit message
        set --local rebased_from_hash (git show -s --format=%B $commit_hash | grep 'Rebased-From:' | cut -d ' ' -f 2)

        # If we've found diff the patches produced by both commits
        if test -n "$rebased_from_hash"

            # Get patches
            git show $commit_hash > $tmpdir/$commit_hash
            git show $rebased_from_hash > $tmpdir/$rebased_from_hash

            # Diffa using delta
            delta $tmpdir/$rebased_from_hash $tmpdir/$commit_hash
        end
    end

    # Cleanup
    rm --recursive $tmpdir
end
