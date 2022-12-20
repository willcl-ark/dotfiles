-- Install + manage plugins
require('user.plugins')

-- Setup user options + keymaps
require('user.options')
require('user.keymaps') -- NOTE: Must happen before plugins are required (otherwise wrong leader will be used)

-- Setup plugins
require('user.lualine')
require('Comment').setup()
require('user.blankline')
require('user.gitsigns')
require('nvim-surround').setup()
require('user.lastplace')
require('user.telescope')
require('user.treesitter')
require('user.lsp')
require('user.cmp')
require('user.autocommands')
require('user.asciidoctor')
require('user.twilight')
