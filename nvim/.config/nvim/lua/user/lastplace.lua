-- Enable nvim-lastplace
local lastplace_ok, lastplace = pcall(require, "nvim-lastplace")
if not lastplace_ok then
    vim.notify("nvim-lastplace failed to load")
    return
end

lastplace.setup({
    lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
    lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
    lastplace_open_folds = true
})

