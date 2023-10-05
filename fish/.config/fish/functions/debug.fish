function debug

    set -l cmd $argv[1]
    set -l arg $argv[2]

    switch $cmd
        case main ''
            nvim $HOME/.bitcoin/debug.log
        case test
            nvim $HOME/.bitcoin/testnet3/debug.log
        case signet
            nvim $HOME/.bitcoin/signet/debug.log
        case regtest
            nvim $HOME/.bitcoin/regtest/debug.log
        case tail
            switch $arg
                case main
                    tail -n 50 -f $HOME/.bitcoin/debug.log
                case test
                    tail -n 50 -f $HOME/.bitcoin/testnet3/debug.log
                case signet
                    tail -n 50 -f $HOME/.bitcoin/signet/debug.log
                case regtest
                    tail -n 50 -f $HOME/.bitcoin/regtest/debug.log
                case '*'
                    echo 'Invalid argument. Valid arguments after "tail": main, test, signet, regtest.'
                    exit 1
            end
        case '*'
            echo 'Invalid command or argument. Valid commands and arguments: main, test, signet, regtest, tail [main, test, signet, regtest].'
            exit 1
    end
end
