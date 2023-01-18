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
    check-version alacritty
    switch $status
        case 1
            update-alacritty
        case '*'
    end

    # neovim
    _updating-name neovim
    cd $SRC/neovim
    check-version nvim
    switch $status
        case 1
            update-neovim
        case '*'
    end

    # Only run these if we invoke with --all
    switch $_flag_all
        case --all
            # Bear
            _updating-name Bear
            cd $SRC/Bear/build
            check-version bear
            switch $status
                case 1
                    update-bear
                case '*'
            end

            # Cargo-installed applications
            _updating-name Cargo-apps
            cargo install-update -a

            # yt-dlp
            _updating-name yt-dlp
            update-yt-dlp

            # fzf
            _updating-name fzf
            cd $HOME/.fzf
            check-version fzf
            switch $status
                case 1
                    update-fzf
                case '*'
            end

            # rust-analyzer
            # TODO: update this to use source repo
            _updating-name rust-analyzer
            cd $HOME
            update-rust-analyzer

        case '*'
    end
    popd    # end of src install
end
