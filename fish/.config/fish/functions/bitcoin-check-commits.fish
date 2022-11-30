function bitcoin-check-commits
    argparse --ignore-unknown 't/test' -- $argv
    if set -q _flag_test
        if not mountpoint -q -- /mnt/tmp/
            echo "Mount tmpfs to /mnt/tmp/ before running"
            return 1
        end
        git rebase \
            --exec "bear -- make -j16" \
            --exec "make -j16 check" \
            --exec "test/lint/all-lint.py" \
            --exec "test/functional/test_runner.py --jobs=50 --cachedir=/mnt/tmp/cache --tmpdir=/mnt/tmp/" \
            "HEAD~$argv"
    else
        git rebase \
        --exec "bear -- make -j16" \
        --exec "make -j16 check" \
        --exec "test/lint/all-lint.py" \
        "HEAD~$argv"
    end
end
