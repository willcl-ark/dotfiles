function remake_clightning
    make clean
    ./configure --enable-developer --disable-valgrind
    make -j4 
end
