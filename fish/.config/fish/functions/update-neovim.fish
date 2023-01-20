function update-neovim
    make distclean
    #make deps
    make -j16 CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/neovim" CMAKE_BUILD_TYPE=Release
    sudo make install
end
