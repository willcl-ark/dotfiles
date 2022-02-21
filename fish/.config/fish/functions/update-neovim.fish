function update-neovim
    # For some reason ninja generates log files owned by root which prevent us from re-running make in the future
    # Take ownership of them (all)
    sudo chown -R will:will $HOME/src/neovim/
    make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/neovim" CMAKE_BUILD_TYPE=Release -j16
    sudo make install
end
