function rc-teardown
    $BINARY_PATH/bitcoin-cli -datadir=$DATA_DIR -signet stop
    rm -i -Rf $DATA_DIR
    set --erase RC_VERSION
    set --erase DATA_DIR
    set --erase BINARY_PATH
    set --erase QT_PATH
    set --erase _bitcoind
    set --erase _cli
    set --erase _qt
    abbr --erase bitcoind
    abbr --erase cli
    abbr --erase qt
end
