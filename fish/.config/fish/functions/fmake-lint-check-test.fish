function fmake-lint-check-test

    ./test/lint/all-lint.py; or begin
        notify-send "./test/lint/all-lint.py failed"
        return
    end

    if test -d test/lint/test_runner/
        pushd test/lint/test_runner/
        cargo fmt
        cargo clippy
        cargo run; or begin
            notify-send "Rust linter failed"
            return
        end
        popd
    else
        # Optional: Notify if the directory does not exist
        notify-send "Not running Rust linter. test/lint/test_runner/ directory does not exist"
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
