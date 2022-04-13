-- Use clang as default C compiler
require 'nvim-treesitter.install'.compilers = { 'clang' }

local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup {
  -- ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = {
    "bash",
    "c",
    "cmake",
    "commonlisp",
    "cpp",
    "dockerfile",
    "fennel",
    "fish",
    "go",
    "haskell",
    "html",
    "java",
    "javascript",
    "json",
    "json5",
    "kotlin",
    "latex",
    "llvm",
    "lua",
    "make",
    "markdown",
    "nix",
    "perl",
    "php",
    "python",
    "regex",
    "rust",
    "scheme",
    "scss",
    "swift",
    "toml",
    "typescript",
    "vim",
    "yaml",
    },
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = { "" }, -- List of parsers to ignore installing
  autopairs = {
    enable = true,
  },
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true, disable = { "yaml" } },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
}
