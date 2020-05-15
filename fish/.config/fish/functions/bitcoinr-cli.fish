# Defined in - @ line 0
function bitcoinr-cli --description 'alias bitcoinr-cli=bitcoin-cli -datadir=$BITCOIN_REGTEST'
	bitcoin-cli -datadir=$BITCOIN_REGTEST $argv;
end
