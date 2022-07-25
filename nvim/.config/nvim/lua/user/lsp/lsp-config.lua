-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  --local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.api.nvim_buf_set_keymap(bufnr,	"n",	"<leader>lD",   "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr,	"n",	"<leader>ld",   "<cmd>lua require('telescope.builtin').lsp_definitions()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr,	"n",	"K",            "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr,	"n",	"<leader>li",   "<cmd>lua require('telescope.builtin').lsp_implementations()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr,	"n",	"<leader>sh",   "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr,	"n",	"<leader>rn",   "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr,	"n",	"<leader>lr",   "<cmd>lua require('telescope.builtin').lsp_references()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr,	"n",	"<leader>lca",  "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr,	"n",	"[d",           "<cmd>lua vim.diagnostic.goto_prev({ border = 'rounded' })<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr,	"n",	"<leader>h",    "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr,	"n",	"]d",           "<cmd>lua vim.diagnostic.goto_next({ border = 'rounded' })<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr,	"n",	"<leader>q",    "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr,	"n",	"<leader><leader>f",   "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr,	"n",	"<leader><leader>ff",   "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

-- Setup a default handler for all installed servers
require("mason-lspconfig").setup_handlers({
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function (server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {
            on_attach = on_attach,
            flags = lsp_flags,
        }
    end,
    -- Next, you can provide targeted overrides for specific servers.
    ["rust_analyzer"] = function ()
        require("rust-tools").setup {
        }
    end,
    ["sumneko_lua"] = function ()
        require("lspconfig").sumneko_lua.setup {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" }
                    }
                }
            }
        }
    end,
})

-- Add cmp_nvim_lsp
local capabilities = vim.lsp.protocol.make_client_capabilities()
require("cmp_nvim_lsp").update_capabilities(capabilities)
