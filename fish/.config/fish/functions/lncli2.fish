# Defined in - @ line 0
function lncli2 --description 'alias lncli2=lncli -n regtest --lnddir=$LND2_DIR --rpcserver=localhost:11009'
	lncli -n regtest --lnddir=$LND2_DIR --rpcserver=localhost:11009 $argv;
end
