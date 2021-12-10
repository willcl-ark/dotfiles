# Defined in /var/folders/0d/tgscg8cj0rx035gf2lvl15fh0000gn/T//fish.7GmPi0/compilecore.fish @ line 2
function compilecore

    set_color magenta
    echo building bitcoin core from directory $PWD/
    echo starting autogen.sh
    set_color normal

    # autogen
    ./autogen.sh
    if test "$status" -eq 0
        set_color green; echo autogen.sh........OK; set_color normal
    else
        set_color red; echo autogen.sh FAILED; set_color normal
        return 1
    end

    # Build BerkleyDB from source
    # ./contrib/install_db4.sh .
    set -x BDB_PREFIX '/Users/will/src/bitcoin/db4'
    set_color magenta; echo BDB_PREFIX=$BDB_PREFIX; set_color normal

    set_color magenta; echo starting configure...; set_color normal
    ./configure BDB_LIBS="-L$BDB_PREFIX/lib -ldb_cxx-4.8" BDB_CFLAGS="-I$BDB_PREFIX/include" --without-miniupnpc --enable-hardening --without-gui
    if test "$status" -eq 0
        set_color green; echo configure........OK; set_color normal
    else
        set_color red; echo configure FAILED; set_color normal
        return 1
    end

    set_color magenta; echo starting make...; set_color normal
    make -j4
    if test "$status" -eq 0
        set_color green; echo make........OK; set_color normal
    else
        set_color red; echo make FAILED; set_color normal
        return 1
    end
end
