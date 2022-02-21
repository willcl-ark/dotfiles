function update-bear
    cmake -DENABLE_UNIT_TESTS=OFF -DENABLE_FUNC_TESTS=OFF $SRC/Bear
    make all
    sudo make install
end
