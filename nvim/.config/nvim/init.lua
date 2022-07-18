require "user.asciidoctor"
require "user.autocommands"
require "user.autopairs"
require "user.cmp"
require "user.fidget"
require "user.gitsigns"
require "user.impatient"
require "user.indentline"
require "user.keymaps"
require "user.lsp"
require "user.lualine"
require "user.markdown-preview"
vim.g.markdown_fenced_languages = {
  "mermaid=mermaid"
}
require "user.nvim-lastplace"
require "user.nvim-surround"
if os.getenv("DARK") == "0" then
    require('solarized').set()
else
    require "user.onedark"
end
require "user.options"
require "user.plugins"
require "user.telescope"
require "user.treesitter"
