function pastebin
    read -z input
    set res (curl -X PUT --data $input https://paste.256k1.dev)

    if test (count $argv) -gt 0
        echo "$res.$argv[1]"
    else
        echo $res
    end
end
