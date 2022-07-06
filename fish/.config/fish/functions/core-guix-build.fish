function core-guix-build
    argparse 'f/force' -- $argv

    if not set -q _flag_force
        if not string match --regex --quiet 'bitcoin' $PWD
            echo "CWD appears incorrect: $PWD"
            return 1
        end
    end

    set --local vars SIGNER GUIX_SIGS_REPO DETACHED_SIGS_REPO VERSION
    for v in $vars
        if not set -q $v
            echo "$v not set"
            set --local verr
        end
    end
    if set -q verr
        return 1
    end

    # Prepare repo
    git fetch --all
    git checkout v$VERSION

    # Build
    ./contrib/guix/guix-build

    # Attest non-codesigned
    ./contrib/guix/guix-attest
    pushd $GUIX_SIGS_REPO
    git switch main
    git pull
    git checkout -b {$VERSION}-non-codesigned
    git add $VERSION
    git commit -m "Add attestations by $SIGNER for $VERSION non-codesigned"
    git push
    popd
    xdg-open https://github.com/bitcoin-core/guix.sigs

    # Sign binaries
    pushd $DETACHED_SIGS_REPO
    git fetch
    git checkout v$VERSION
    popd
    ./contrib/guix/guix-codesign

    # Attest codesigned binaries
    ./contrib/guix/guix-attest
    pushd $GUIX_SIGS_REPO
    git switch main
    git pull
    git checkout -b {$VERSION}-codesigned
    git add $VERSION
    git commit -m "Add attestations by $SIGNER for $VERSION codesigned"
    git push
    popd
    xdg-open https://github.com/bitcoin-core/guix.sigs

    # Verify sigs
    pushd $GUIX_SIGS_REPO
    git switch main
    git pull
    popd
    ./contrib/guix/guix-verify

end
