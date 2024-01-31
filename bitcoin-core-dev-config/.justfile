set dotenv-load := true

alias m := build-min
alias ca := check-pull-full
alias cf := check-pull-format
alias cfd := clang-format-diff
alias sync := sync-master
alias ta := test-all
alias tf := test-functional
alias tu := test-unit

[private]
default:
  just --list

# fetch all tags and prune
fetch-all:
    git fetch --all --tags --prune

# switch to master, fetch-all, reset --hard and push to origin
[confirm("Confirm you want to `reset --hard` master branch?")]
sync-master:
    git switch master
    just fetch-all
    git reset --hard upstream/master
    git push origin --force

# configure and build all components
make-all:
    bear -- ./configure
    bear -- make -j`nproc`

# configure and build bitcoind and bitcoin-cli
build-min *ARGS:
    bear -- ./configure --with-incompatible-bdb --without-miniupnpc --without-natpmp --disable-bench --without-gui --enable-debug {{ARGS}}
    bear -- make -j`nproc` -C src bitcoind bitcoin-cli

# run all unit and functional tests
test-all:
    bear -- make -j`nproc` check
    test/functional/test_runner.py --jobs=16 --cachedir=/mnt/tmp/cache --tmpdir=/mnt/tmp

# run a single functional test
test-functional test:
    test/functional/test_runner.py {{test}}

# run a single unit test suite
test-unit tests *ARGS:
    test_bitcoin --log_level=all --run_test={{tests}} {{ARGS}}

# run the rust linter
lint:
    #!/usr/bin/env bash
    # run using subshell to load python venv for flake8
    cd test/lint/test_runner/
    cargo fmt
    cargo clippy
    cargo run

# run clang-format-diff on top commit
clang-format-diff:
    git diff -U0 HEAD~1.. | ./contrib/devtools/clang-format-diff.py -p1 -i -v

# build, test, lint and check
check:
    just lint
    just make-all
    just test-all

# check all commits pass linter and clang-format-diff
check-pull-format:
    git rebase `git merge-base HEAD upstream/master` \
    --exec "just clang-format-diff" \
    --exec "just lint"

# check all commits in a branch against master
check-pull-full:
    git rebase -i `git merge-base HEAD upstream/master` \
    --exec "just clang-format-diff" \
    --exec "just check"
