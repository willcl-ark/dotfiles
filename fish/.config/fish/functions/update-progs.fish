function update-progs
    argparse --name=update-progs 'a/all' -- $argv
    echo "$_flag_all"

    function _updating-name
        set_color magenta
        echo "Updating $argv[1]"
        set_color normal
    end

    function _print-err
        for i in $argv
            echo $i
        end
    end

    # Start src installs
    set SRC "/home/will/src"
    pushd $SRC

    # Alacritty
    _updating-name Alacritty
    cd $SRC/alacritty
    set ERR (compare-git-tip)
    switch $status
        case 0
            check-version alacritty
            switch $status
                case 1
                    update-alacritty
                case '*'
            end
        case 1
            update-alacritty
        case 2
            # Some error
            echo $ERR
    end

    # neovim
    _updating-name neovim
    cd $SRC/neovim
    set ERR (compare-git-tip)
    switch $status
        case 0
            check-version nvim
            switch $status
                case 1
                    update-neovim
                case '*'
            end
        case 1
            update-neovim
        case 2
            # Some error
            echo $ERR
    end

    # Only run these if we invoke with --all
    switch $_flag_all
        # Bear
        case --all
            _updating-name Bear
            cd $SRC/Bear/build
            set ERR (compare-git-tip)
            switch $status
                case 0
                    check-version bear
                    switch $status
                        case 1
                            update-bear
                        case '*'
                    end
                case 1
                    update-bear
                case 2
                    echo $ERR
            end

            # yt-dlp
            _updating-name yt-dlp
            update-yt-dlp

            # fzf
            _updating-name fzf
            cd $HOME/.fzf
            set ERR (compare-git-tip)
            switch $status
                case 0
                    check-version fzf
                    switch $status
                        case 1
                            update-fzf
                        case '*'
                    end
                case 1
                    update-fzf
                case 2
                    echo $ERR
            end
        case '*'
    end
    popd    # end of src install
end
