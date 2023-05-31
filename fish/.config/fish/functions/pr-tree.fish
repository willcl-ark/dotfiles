function pr-tree
    #  needs https://github.com/despreston/gh-worktree
    gh worktree pr $argv[1] "../bitcoin-$argv[1]"
end
