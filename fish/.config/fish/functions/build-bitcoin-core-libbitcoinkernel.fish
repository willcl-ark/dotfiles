function build-bitcoin-core-libbitcoinkernel
    # Set up ramdisk
    set --local CACHEDIR "/mnt/tmp"
    if not test -d $CACHEDIR
        echo "Ramdisk not found at $CACHEDIR. Creating one with sudo now..."
        sudo mkdir -p $CACHEDIR
        sudo mount -t tmpfs -o size=4g tmpfs $CACHEDIR
    else
        echo "Found directory at $CACHEDIR to use for tmpfs"
    end

    # Build Bitcoin
    ./configure BDB_LIBS="-L$BDB_PREFIX/lib -ldb_cxx-4.8" BDB_CFLAGS="-I$BDB_PREFIX/include" --without-gui --with-sqlite=yes --enable-experimental-util-chainstate && \
    bear -- make -j16 && \
    make -j16 check && \
    test/functional/test_runner.py --jobs=32 --cachedir=$CACHEDIR/cache --tmpdir=$CACHEDIR

    # Unmount ramdisk
    read --prompt-str "Do you want to unmount and erase the tmpfs (y/n)? " --local --nchars 1 res
    if test $res = "y" -o "Y"
        sudo umount $CACHEDIR
        sudo rm -Rf $CACHEDIR
    end
end
