# Defined in - @ line 0
function bitcoinr --description 'alias bitcoinr=bitcoind -datadir=$BITCOIN_REGTEST'
	bitcoind -datadir=$BITCOIN_REGTEST $argv;
end
