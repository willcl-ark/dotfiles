function fmake-lint-check-test

    bear -- make -j16; or begin
        notify-send "bear -- make -j16 failed"
        return
    end

    ./test/lint/all-lint.py; or begin
        notify-send "./test/lint/all-lint.py failed"
        return
    end

    make -j16 check; or begin
        notify-send "make -j16 check failed"
        return
    end

    test/functional/test_runner.py --jobs=16 --cachedir=/mnt/tmp/cache --tmpdir=/mnt/tmp; or begin
        notify-send "test/functional/test_runner.py failed"
        return
    end

    notify-send "make-lint-check-test complete"

end
