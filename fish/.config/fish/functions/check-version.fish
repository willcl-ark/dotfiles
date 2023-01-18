function check-version
    # Returns 0 if it finds git tip in version string
    # Works for most programs
    git fetch --all --tags --force --prune

    # Checkout the most recent non-nightly tag
    set --local TAG (git describe --tags --exclude "nightly" --exclude "rc" --abbrev=0 (git rev-list --tags --max-count=1))

    echo "$argv[1] git at $TAG"
    # Match on version numbers of digit form xxx.xxx.xxxx
    # Version numbers with letters will fail
    # https://regex101.com/r/t6kNLi/1
    set ver_installed ($argv[1] --version | string match -r "\d{1,3}\.\d{1,3}\.\d{1,4}")
    echo "$argv[1] installed at $ver_installed"
    # Remove leading "v" from tags for better matching
    set --local VTAG (string replace --regex "^v" "" $TAG)
    string match "*$VTAG*" $ver_installed
    switch $status
        case 0
            echo "$argv[1]: installed version matches latest tag"
            return 0
        case 1
            echo "$argv[1]: installed version does not match latest tag, checkout out $TAG"
            git checkout $TAG &> /dev/null
            return 1
    end
end
