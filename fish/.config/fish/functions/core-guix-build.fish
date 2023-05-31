function core-guix-build
    argparse 'c/codesigned' 'n/non-codesigned' 'a/all' -- $argv

    if set -q _flag_all
        set _flag_non-codesigned
        set _flag_codesigned
    end

    set --local required_vars SIGNER GUIX_SIGS_REPO DETACHED_SIGS_REPO VERSION
    set --local verr
    for v in $required_vars
        if not set -q $v
            echo "$v not set"
            set verr 1
        end
    end
    if test -n "$verr"
        return 1
    end

    # Set name by splitting SIGNER
    set --local SIGNER_NAME (string split "=" $SIGNER)[2]

    # Prepare repo
    git fetch upstream --tags
    git checkout v$VERSION

    if set -q _flag_non-codesigned

        # Build
        ./contrib/guix/guix-build

        # Attest non-codesigned
        ./contrib/guix/guix-attest
        pushd $GUIX_SIGS_REPO
        git switch main
        git pull
        git checkout -b {$VERSION}-non-codesigned
        git add $VERSION
        git commit -m "Add attestations by $SIGNER_NAME for $VERSION non-codesigned"
        git push --set-upstream origin $VERSION-non-codesigned
        popd
    end

    if set -q _flag_codesigned

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
        git commit -m "Add attestations by $SIGNER_NAME for $VERSION codesigned"
        git push --set-upstream origin $VERSION-codesigned
        popd
        xdg-open https://github.com/bitcoin-core/guix.sigs
    end

    # Verify sigs
    pushd $GUIX_SIGS_REPO
    git switch main
    git pull
    popd
    SIGNER=$SIGNER_NAME ./contrib/guix/guix-verify

end
