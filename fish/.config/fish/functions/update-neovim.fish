function update-neovim
    make distclean
    make -j16 CMAKE_BUILD_TYPE=RelWithDebInfo
    sudo make install
end
