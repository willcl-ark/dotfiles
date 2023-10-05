function bitcoin-core-rpc-perf
    # Start perf in the background
    sudo perf record -g --call-graph dwarf -F 101 -p (pidof bitcoind) &
    set -l PERF_PID $last_pid

    # Optional: Give perf some time to start
    sleep 1

    # Run the RPC call with additional arguments
    /home/will/src/bitcoin/src/bitcoin-cli $argv > /dev/null

    # Stop perf after the RPC call completes
    sudo kill $PERF_PID
end
