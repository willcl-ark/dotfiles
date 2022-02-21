function update-alacritty
   # Build
    cargo build --release && \
    sudo cp target/release/alacritty /usr/local/bin && \
    ## Terminfo
    sudo tic -xe alacritty,alacritty-direct extra/alacritty.info && \
    ## Desktop Entry (Ubuntu)
    sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg && \
    sudo desktop-file-install extra/linux/Alacritty.desktop && \
    sudo update-desktop-database && \
    ## Completions
    mkdir -p $fish_complete_path[1] && \
    cp extra/completions/alacritty.fish $fish_complete_path[1]/alacritty.fish
end
