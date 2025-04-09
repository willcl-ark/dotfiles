function commit-random
    set word_file "/home/will/src/bips/bip-0039/english.txt"

    if not test -f $word_file
        echo "Error: Word file not found at $word_file"
        return 1
    end

    set chosen_words (shuf -n 5 $word_file | string join ' ')

    git add .
    git commit -m $chosen_words

    echo "Committed with message: $chosen_words"

end
