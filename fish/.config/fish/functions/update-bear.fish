function update-bear
    cmake -DENABLE_UNIT_TESTS=OFF -DENABLE_FUNC_TESTS=OFF $HOME/src/Bear
    make -j16 all
    sudo make install
end
