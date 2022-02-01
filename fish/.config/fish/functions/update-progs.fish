function update-progs
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
    if test $status = 0
        # Build
        cargo build --release && \
        sudo cp target/release/alacritty /usr/local/bin
        ## Terminfo
        sudo tic -xe alacritty,alacritty-direct extra/alacritty.info
        ## Desktop Entry (Ubuntu)
        sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
        sudo desktop-file-install extra/linux/Alacritty.desktop
        sudo update-desktop-database
        ## Completions
        mkdir -p $fish_complete_path[1]
        cp extra/completions/alacritty.fish $fish_complete_path[1]/alacritty.fish
    else 
        _print-err $ERR
    end

    # neovim
    _updating-name neovim
    cd $SRC/neovim
    set ERR (compare-git-tip)
    if test $status = 0
        # For some reason ninja generates log files owned by root which prevent us from re-running make in the future
        # Take ownership of them
        for file in (find . -name "*ninja*")
            sudo chown -R will:will $file
        end
        make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/neovim" CMAKE_BUILD_TYPE=Release -j16
        sudo make install
    else
        _print-err $ERR
    end

    # Bear
    _updating-name Bear
    cd $SRC/Bear/build
    set ERR (compare-git-tip)
    if test $status = 0
        cmake -DENABLE_UNIT_TESTS=OFF -DENABLE_FUNC_TESTS=OFF $SRC/Bear
        make all
        sudo make install
    else
        _print-err $ERR
    end

    # youtube-dl
    _updating-name youtube-dl
    set cur_version (youtube-dl --version)
    if test (curl --include --silent https://yt-dl.org/downloads/latest/youtbe-dl | grep $cur_version | wc -l) = 1
        set_color green
        echo "Already on latest version"
        set_color normal
    else
        sudo wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl
        sudo chmod a+rx /usr/local/bin/youtube-dl
        set_color green
        echo "Updated youtube-dl"
        set_color normal
    end

    popd    # end of src install

end
