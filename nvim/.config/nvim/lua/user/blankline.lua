-- Enable `lukas-reineke/indent-blankline.nvim`
local blankline_ok, blankline = pcall(require, "indent_blankline")
if not blankline_ok then
    vim.notify("indent_blankline failed to load")
    return
end

-- See `:help indent_blankline.txt`
blankline.setup {
  char = '┊',
  show_trailing_blankline_indent = false,
}

