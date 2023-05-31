function build-min

    set config_file "config.log"
    set lines_to_match "USE_BDB_FALSE=''" "USE_NATPMP_FALSE=''" "USE_UPNP_FALSE=''" "ENABLE_BENCH_FALSE=''" "ENABLE_QT_FALSE=''" "DEBUG_CPPFLAGS=' -DDEBUG"

    set matches 0

    if test -e $config_file
        for line in $lines_to_match
            if grep -Fq "$line" $config_file
                set matches (math $matches + 1)
            end
        end
    end

    if test $matches -ne (count $lines_to_match)
        bear -- ./configure --without-bdb --without-miniupnpc --without-natpmp --disable-bench --without-gui --enable-debug
    end

    set num_procs (nproc)
    bear -- make -j$num_procs -C src bitcoind bitcoin-cli

end
