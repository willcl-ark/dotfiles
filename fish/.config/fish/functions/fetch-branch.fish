function fetch-branch --description 'Fetch from [user]/[repo] a [branch] and check it out.'
    argparse h/help -- $argv
    or return

    if set -ql _flag_help
        echo "fetch-branch [-h|--help] [user] [repo] [branch]"
        return 0
    end

    git fetch "https://github.com/$argv[1]/$argv[2].git" "$argv[3]":"$argv[3]"
    git checkout "$argv[3]"
end
