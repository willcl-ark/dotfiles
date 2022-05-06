local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

local sources = {
    formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
    formatting.black.with({ extra_args = { "--fast" } }),
    formatting.stylua,
    formatting.eslint_d,
    -- formatting.clang_format,
    formatting.fish_indent,
    formatting.rustfmt,
    -- diagnostics.flake8,
    diagnostics.gitlint,
    diagnostics.shellcheck,
    diagnostics.eslint_d,
}

local options = {
    cmd = { "nvim" },
    debounce = 250,
    debug = false,
    default_timeout = 5000,
    diagnostics_format = "[#{c}] #{m} (#{s})",
    fallback_severity = vim.diagnostic.severity.ERROR,
    log = {
        enable = true,
        level = "warn",
        use_console = "async",
    },
    on_attach = nil,
    on_init = nil,
    on_exit = nil,
    -- root_dir = u.root_pattern(".null-ls-root", "Makefile", ".git"),
    sources = sources,
    update_in_insert = false,
}

null_ls.setup(options)
