-- Gitsigns
local gitsigns_ok, gitsigns = pcall(require, "gitsigns")
if not gitsigns_ok then
    vim.notify("gitsigns failed to load")
    return
end

-- See `:help gitsigns.txt`
gitsigns.setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
}

