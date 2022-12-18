-- Set lualine as statusline
local lualine_ok, lualine = pcall(require, "lualine")
if not lualine_ok then
    vim.notify("lualine failed to load")
    return
end

-- See `:help lualine.txt`
lualine.setup {
  options = {
    icons_enabled = false,
    theme = 'onedark',
    component_separators = '|',
    section_separators = '',
  },
}

