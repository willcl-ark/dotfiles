function rc-setup
    if test ! -e src/validation.cpp
        echo "Could not detect src/validation.cpp file."
        echo "Ensure you run this function from inside the Bitcoin Core source directory."
        return 1
    end
    if not set -q RC_VERSION
        read --export --universal --prompt-str "RC Version: " RC_VERSION
        set --export --universal DATA_DIR /tmp/$RC_VERSION
        if test ! -d $DATA_DIR
            mkdir --parents $DATA_DIR
        end
        set --export --universal BINARY_PATH $PWD/src
        set --export --universal QT_PATH $PWD/src/qt

        set --export --universal  _bitcoind $BINARY_PATH/bitcoind -datadir=$DATA_DIR -signet
        set --export --universal  _cli $BINARY_PATH/bitcoin-cli -datadir=$DATA_DIR -signet
        set --export --universal  _qt $QT_PATH/bitcoin-qt -datadir=$DATA_DIR -signet
        abbr --add bitcoind $_bitcoind
        abbr --add cli $_cli
        abbr --add qt $_qt
    end
end
