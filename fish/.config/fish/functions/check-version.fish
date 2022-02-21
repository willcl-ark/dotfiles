function check-version
    # Returns 0 if it finds git tip in version string
    # Works for most programs
    set ver_git (git log --oneline | head -n 1 | awk '{print $1;}')
    echo "$argv[1] git at $ver_git"
    set ver_installed ($argv[1] --version)
    echo "$argv[1] installed at $ver_installed"
    string match "*$ver_git*" $ver_installed
    switch $status
        case 0
            echo "$argv[1]: installed version matches tip"
            return 0
        case 1
            echo "$argv[1]: installed version behind tip"
            return 1
    end
end
