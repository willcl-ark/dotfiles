function bissue
    if not set -q argv[1]
        echo "provide an issue number"
        return 1
    end

    set --local datadir "/tmp/bitcoin_$argv[1]"
    mkdir -p $datadir
    touch $datadir/bitcoin.conf
    echo "Do you want to edit bitcoin.conf? Yes [1] No [2]"
    read --local --prompt-str "> " edit

    switch $edit
        case 1 Y y
            nvim $datadir/bitcoin.conf
        case '*'
    end

    commandline "/home/will/src/bitcoin/src/bitcoind -datadir=$datadir"
end
