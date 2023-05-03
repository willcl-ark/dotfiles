function build-min-depends

    set host_triplet (gcc -dumpmachine)
    set config_file "$PWD/config.log"
    set lines_to_match "USE_BDB_FALSE=''" "USE_NATPMP_FALSE=''" "USE_UPNP_FALSE=''" "ENABLE_BENCH_FALSE=''" "ENABLE_QT_FALSE=''" "DEBUG_CPPFLAGS=' -DDEBUG" "LDFLAGS='-L/home/will/src/bitcoin/depends/x86_64-pc-linux-gnu/lib '"
    set depends_make_command "make -C depends -j16 NO_QT=1"
    set matches 0

    if test -e $config_file
        for line in $lines_to_match
            if grep -Fq "$line" $config_file
                set matches (math $matches + 1)
            end
        end
    end

    if test $matches -ne (count $lines_to_match)
        if not grep -Fq "LDFLAGS='-L$PWD/depends/$host_triplet/lib '" $config_file
            eval $depends_make_command
        end
        CONFIG_SITE="$PWD/depends/x86_64-pc-linux-gnu/share/config.site" bear -- ./configure --without-bdb --without-miniupnpc --without-natpmp --disable-bench --without-gui --enable-debug
    end

    set num_procs (nproc)
    bear -- make -j$num_procs src/bitcoind src/bitcoin-cli
end
