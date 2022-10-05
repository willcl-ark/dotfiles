function rc-reset
    $BINARY_PATH/bitcoin-cli -datadir=$DATA_DIR -signet stop
    rm -i -Rf $DATA_DIR
    mkdir $DATA_DIR
    $BINARY_PATH/bitcoind -daemon
end
