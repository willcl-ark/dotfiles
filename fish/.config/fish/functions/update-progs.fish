function update-progs
    # Setup
    set SRC "/home/will/src"
    pushd $SRC

    # Update Alacritty
    cd alacritty
    git checkout master
    git pull
    ## Terminfo
    sudo tic -xe alacritty,alacritty-direct extra/alacritty.info
    ## Binary
    sudo cp target/release/alacritty /usr/local/bin # or anywhere else in $PATH
    ## Desktop Entry (Ubuntu)
    sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
    sudo desktop-file-install extra/linux/Alacritty.desktop
    sudo update-desktop-database
    ## Completions
    mkdir -p $fish_complete_path[1]
    cp extra/completions/alacritty.fish $fish_complete_path[1]/alacritty.fish

    cd $SRC


    # Update neovim
    cd neovim
    git checkout master
    git pull
    make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/neovim" CMAKE_BUILD_TYPE=Release -j16
    sudo make install

    # Teardown
    pushd
end
