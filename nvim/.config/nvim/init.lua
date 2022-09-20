-- Install plugins first
require "user.plugins"

-- Speedup plugin loading
require "user.impatient"

require "user.options"
-- Load remaining plugins
require "user.asciidoctor"
require "user.autocommands"
require "user.autopairs"
require "user.cmp"
require "user.comment"

-- Load a default color scheme if none exists
local ok, _ = pcall(require, "user.colorscheme")
if not ok then
    require "user.onedark"
end

require "user.fidget"
require "user.gitsigns"
require "user.indentline"
require "user.keymaps"
require "user.lsp"
require "user.lualine"
require "user.nvim-colorizer"
require "user.nvim-lastplace"
require "user.nvim-surround"
require "user.telescope"
require "user.treesitter"

require "user.build"
