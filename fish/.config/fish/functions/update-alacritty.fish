function update-alacritty
    # Build & install
    cargo build --release && \
    # To update running binary, remove inode link and link new binary inode to old location
    # UPdate will fulfill when application next restarted
    sudo rm /usr/local/bin/alacritty && \
    sudo cp target/release/alacritty /usr/local/bin/alacritty && \
    # Terminfo
    sudo tic -xe alacritty,alacritty-direct extra/alacritty.info && \
    # Desktop Entry (Ubuntu)
    if test (uname -s) = Linux
        sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg && \
        sudo desktop-file-install extra/linux/Alacritty.desktop && \
        sudo update-desktop-database
    end
    # Manpages
    sudo mkdir -p /usr/local/share/man/man1 && \
    gzip -c extra/alacritty.man | sudo tee /usr/local/share/man/man1/alacritty.1.gz > /dev/null && \
    gzip -c extra/alacritty-msg.man | sudo tee /usr/local/share/man/man1/alacritty-msg.1.gz > /dev/null && \
    # Completions
    mkdir -p $fish_complete_path[1] && \
    cp extra/completions/alacritty.fish $fish_complete_path[1]/alacritty.fish
end
