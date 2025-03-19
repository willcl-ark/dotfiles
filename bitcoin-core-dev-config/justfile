################################################################################
# This justfile is designed to be placed one directory above the bitcoin core source tree
# e.g.
#
# src/core/
# ├── bitcoin
# │   ├── build
# │   ├── ci
# │   ├── cmake
# │   ├── CMakeLists.txt
# │   ├── CMakePresets.json
# │   ├── contrib
# │   ├── CONTRIBUTING.md
# │   ├── COPYING
# │   ├── depends
# │   ├── doc
# │   ├── INSTALL.md
# │   ├── libbitcoinkernel.pc.in
# │   ├── README.md
# │   ├── SECURITY.md
# │   ├── share
# │   ├── src
# │   ├── test
# │   └── vcpkg.json
# └── justfile
#
# This helps to keep a clean source directory.
#
# If you prefer to use this file from within the bitcoin source directory
# remove the below instruction:
#
# `set working-directory := "bitcoin"`
#
# See https://github.com/casey/just?tab=readme-ov-file#working-directory for
# more information on `working-directory`.
#
################################################################################

set dotenv-load := true
set quiet
set shell := ["bash", "-euc"]
set working-directory := "bitcoin"

os := os()
log-dir := "/tmp/bitcoin-core"

build-log := log-dir + "/build.log"
configure-log := log-dir + "/configure.log"
configure-stdout-log := log-dir + "/configure-stdout.log"
depends-log := log-dir + "/depends.log"
depends-triplet := log-dir + "/triplet"
functional-test-log := log-dir + "/functional-test.log"
unit-test-log := log-dir + "/unit-test.log"

alias b := build
alias bd := build-dev
alias c := clean
alias conf := configure
alias l := log
alias p := prepare
alias rb := rebuild
alias t := test

[private]
default:
    just --list

# Configure default project
[group('build')]
configure *args: setup-logs clean-logs
    cmake -B build {{ args }} > {{configure-stdout-log}} 2> {{configure-log}}

# Make default project
[group('build')]
make *args: && build-done
    cmake --build build -j {{ num_cpus() }} > {{build-log}} 2>&1

# Configure and make default project
[group('build')]
build *args: (configure args) && build-done
    cmake --build build -j {{ num_cpus() }} > {{build-log}} 2>&1

# Configure and make with all optional modules
[group('build')]
build-dev *args: (configure "--preset dev-mode" args) && build-done
    cmake --build build -j {{ num_cpus() }} > {{build-log}} 2>&1

# Re-build current config
[group('build')]
rebuild: && build-done
    rm -f {{build-log}}
    cmake --build build -j {{ num_cpus() }} > {{build-log}} 2>&1

# Build using depends
[group('build')]
build-depends:
    cd depends && gmake -j {{ num_cpus() }} 2>&1 | tee {{depends-log}}
    grep -E '^to: .*/depends/[^/]+$' {{depends-log}} | awk '{print $2}' | sed 's|.*/depends/|depends/|' > {{depends-triplet}}
    just build --toolchain `cat {{depends-triplet}}`/toolchain.cmake

[private]
build-done:
    echo build complete

# Show all cmake variables
[group('build')]
cmake-vars:
    cmake -LAH build 2> {{configure-log}} | less

# Setup logs directory
[private]
setup-logs:
    mkdir -p {{log-dir}}

# Clean old logs
[private]
clean-logs:
    rm -f {{log-dir}}/*.log

# View configuration logs
[group('logs')]
log-configure:
    cat {{configure-log}} | less

# View build log
[group('logs')]
log-build:
    cat {{build-log}} | less

# View configuration summary and build log
[group('logs')]
log:
    cat {{depends-log}} {{configure-log}} {{build-log}} 2>/dev/null | less

# View test logs
[group('logs')]
log-test:
    cat  {{unit-test-log}} {{functional-test-log}} | less

# View all logs
[group('logs')]
log-all:
    cat {{depends-log}} {{configure-stdout-log}} {{configure-log}} {{build-log}} {{unit-test-log}} {{functional-test-log}} 2>/dev/null | less

# Clean build dir and logs
[group('build')]
clean: && clean-logs
    rm -Rf build

# Run unit tests
[group('test')]
testu:
    ctest --test-dir build -j {{ num_cpus() }} 2>&1 | tee {{unit-test-log}}

# Run a single unit test suite
[group('test')]
test-suite suite:
    build/src/test/test_bitcoin --log_level=all --run_test={{suite}} 2>&1 | tee {{unit-test-log}}

# Run functional test(s)
[group('test')]
testf *args:
    build/test/functional/test_runner.py -j {{ num_cpus() }} {{args}} 2>&1 | tee {{functional-test-log}}

# Run all unit and functional tests
[group('test')]
test: testu testf

# Run clang-format-diff on top commit
[no-exit-message]
[private]
format-commit:
    git diff -U0 HEAD~1.. | ./contrib/devtools/clang-format-diff.py -p1 -i -v

# Run clang-format on the diff (must be configured with clang)
[no-exit-message]
[private]
format-diff:
    git diff | ./contrib/devtools/clang-format-diff.py -p1 -i -v

# Run clang-tidy on top commit
[no-exit-message]
[private]
tidy-commit:
    git diff -U0 HEAD~1.. | ( cd ./src/ && clang-tidy-diff-17.py -p2 -j {{ num_cpus() }} )

# Run clang-tidy on the diff (must be configured with clang)
[no-exit-message]
[private]
tidy-diff:
    git diff | ( cd ./src/ && clang-tidy-diff-17.py -p2 -j $(nproc) )

# Run the linters
[group('lint')]
lint:
    DOCKER_BUILDKIT=1 docker build -t bitcoin-linter --file "./ci/lint_imagefile" ./ && docker run --rm -v $(pwd):/bitcoin -it bitcoin-linter

# Run all linters, clang-format and clang-tidy on top commit
[group('lint')]
lint-commit: lint && format-commit tidy-commit

# Run all linters, clang-format and clang-tidy on diff
[group('lint')]
lint-diff: lint && format-diff tidy-diff

# Run a CI stage locally
[group('ci')]
run-ci name:
    env -i HOME="$HOME" PATH="$PATH" USER="$USER" bash -c 'FILE_ENV="./ci/test/00_setup_env_{{ name }}.sh" ./ci/test_run_all.sh'

# Lint (top commit), build and test
[group('pr tools')]
check: lint-commit build testf

# Interactive rebase current branch from (git merge-base) (`just rebase -i` for interactive)
[confirm("Warning, unsaved changes may be lost. Continue?")]
[no-exit-message]
[group('git')]
rebase *args:
    git rebase {{ args }} `git merge-base HEAD upstream/master`

# Update upstream/master and interactive rebase on it (`just rebase-upstream -i` for interactive)
[confirm("Warning, unsaved changes may be lost. Continue?")]
[group('git')]
rebase-upstream *args:
    git fetch upstream
    git rebase {{ args }} `git merge-base HEAD upstream/master`

# Check each commit in the branch passes `just lint`
[confirm("Warning, unsaved changes may be lost. Continue?")]
[no-exit-message]
[private]
rebase-lint:
    git rebase -i `git merge-base HEAD upstream/master` --exec "just lint" \

# Check each commit in the branch passes `just check`
[confirm("Warning, unsaved changes may be lost. Continue?")]
[no-exit-message]
[group('pr tools')]
prepare:
    git rebase -i `git merge-base HEAD upstream/master` --exec "just check" \

# Git range-diff from <old-rev> to HEAD~ against master
[no-exit-message]
[group('git')]
range-diff old-rev:
    git range-diff master {{ old-rev }} HEAD~

# Profile a running bitcoind for 60 seconds (e.g. just profile `pgrep bitcoind`). Outputs perf.data
[no-exit-message]
[group('perf')]
profile pid:
    perf record -g --call-graph dwarf --per-thread -F 140 -p {{ pid }} -- sleep 60

# Run benchmarks
[group('perf')]
bench:
    build/src/bench/bench_bitcoin

# Verify scripted diffs from master to HEAD~
[group('tools')]
verify-scripted-diff:
    test/lint/commit-script-check.sh origin/master..HEAD

# Install python deps from ci/lint/install.sh
[group('tools')]
install-python-deps:
    awk '/^\$\{CI_RETRY_EXE\} pip3 install \\/,/^$/{if (!/^\$\{CI_RETRY_EXE\} pip3 install \\/ && !/^$/) print}' ci/lint/04_install.sh \
        | sed 's/\\$//g' \
        | xargs uv pip install
    uv pip install vulture # currently unversioned in our repo
    uv pip install requests # only used in getcoins.py

# Show project dependencies in browser
[group('tools')]
[linux]
show-deps:
    xdg-open https://github.com/bitcoin/bitcoin/blob/master/doc/build-unix.md

# Show project dependencies in browser
[group('tools')]
[macos]
show-deps:
    open https://github.com/bitcoin/bitcoin/blob/master/doc/build-osx.md

# Show project dependencies in browser
[group('tools')]
[windows]
show-deps:
    explorer https://github.com/bitcoin/bitcoin/blob/master/doc/build-windows.md

# Show project dependencies in browser
[group('tools')]
[openbsd]
show-deps:
    xdg-open https://github.com/bitcoin/bitcoin/blob/master/doc/build-openbsd.md

# Attest to guix build outputs
[group('guix')]
guix-attest:
    contrib/guix/guix-attest

# Perform a guix build with default options
[group('guix')]
guix-build:
    contrib/guix/guix-build

# Clean intermediate guix build work directories
[group('guix')]
guix-clean:
    contrib/guix/guix-clean

# Codesign build outputs
[group('guix')]
guix-codesign:
    contrib/guix/guix-codesign

# Verify build output attestations
[group('guix')]
guix-verify:
    contrib/guix/guix-verify
