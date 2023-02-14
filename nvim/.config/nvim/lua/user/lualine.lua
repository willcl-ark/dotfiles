-- Set lualine as statusline
local lualine_ok, lualine = pcall(require, "lualine")
if not lualine_ok then
    vim.notify("lualine failed to load")
    return
end

-- See `:help lualine.txt`
lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'catppuccin',
    component_separators = '|',
    section_separators = '',
    'filename',
    file_status = true,
    path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
  },
}

