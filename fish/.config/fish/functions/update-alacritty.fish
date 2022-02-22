function update-alacritty
   # Build & install
    cargo build --release && \
    # copy to a temp location
    sudo cp target/release/alacritty /usr/local/bin/alacritty-new && \
    # use `rename` to atomically rename the file: https://man7.org/linux/man-pages/man2/rename.2.html
    sudo rename /usr/local/bin/alacritty-new /usr/local/bin/alacritty && \
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
