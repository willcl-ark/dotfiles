function send-terminfo
    if test (count $argv) -eq 0
        echo "Usage: send-terminfo SERVER_NAME"
        return 1
    end
    infocmp -x | ssh $argv[1] -- tic -x -
end
