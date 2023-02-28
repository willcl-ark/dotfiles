function rebase-build-check
    git rebase -i HEAD~$argv[1] \
        --exec "bear -- make -j16" \
        --exec "./test/lint/all-lint.py" \
        --exec "make -j16 check" \
        --exec "test/functional/test_runner.py --jobs=32 --cachedir=/mnt/tmp/cache --tmpdir=/mnt/tmp"
end
