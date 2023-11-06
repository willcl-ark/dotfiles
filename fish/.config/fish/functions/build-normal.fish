function build-normal

    set config_file "config.log"
    set lines_to_match "USE_BDB_TRUE=''" "ENABLE_QT_TRUE=''"

    set matches 0

    if test -e $config_file
        for line in $lines_to_match
            if grep -Fxq "$line" $config_file
                set matches (math $matches + 1)
            end
        end
    end

    if test $matches -ne (count $lines_to_match)
        bear -- ./configure --with-incompatible-bdb --enable-debug
    end

    set num_procs (nproc)
    bear -- make -j$num_procs src/bitcoind src/bitcoin-cli src/bitcoin-qt

end
