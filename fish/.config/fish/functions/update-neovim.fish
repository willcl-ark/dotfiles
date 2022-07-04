function update-neovim
    make deps
    make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/neovim" CMAKE_BUILD_TYPE=Release -j16
    sudo make install
end
