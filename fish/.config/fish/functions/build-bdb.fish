function build-bdb

    make -C depends NO_BOOST=1 NO_LIBEVENT=1 NO_QT=1 NO_SQLITE=1 NO_NATPMP=1 NO_UPNP=1 NO_ZMQ=1 NO_USDT=1
    set -x BDB_PREFIX $HOME/src/bitcoin/depends/x86_64-pc-linux-gnu
    set -x BDB_LIBS "-L$BDB_PREFIX/lib -ldb_cxx-4.8"
    set -x BDB_CFLAGS "-I$BDB_PREFIX/include"
    bear -- ./configure --without-miniupnpc --without-natpmp --enable-debug

    set num_procs (nproc)
    bear -- make -j$num_procs

end
