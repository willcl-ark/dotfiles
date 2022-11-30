function check-version
    # Returns 0 if it finds git tip in version string
    # Works for most programs

    # Checkout the most recent non-nightly tag
    set --local TAG (git describe --tags --exclude "nightly" --exclude "rc" --abbrev=0 (git rev-list --tags --max-count=1))
    git checkout $TAG

    echo "$argv[1] git at $TAG"
    set ver_installed ($argv[1] --version)
    echo "$argv[1] installed at $ver_installed"
    string match "*$TAG*" $ver_installed
    switch $status
        case 0
            echo "$argv[1]: installed version matches latest tag"
            return 0
        case 1
            echo "$argv[1]: installed version behind latest tag"
            return 1
    end
end
