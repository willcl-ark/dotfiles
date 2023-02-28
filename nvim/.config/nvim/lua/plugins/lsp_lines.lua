return {
  "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  event = "VeryLazy",
  config = function()
    require("lsp_lines").setup({
      vim.diagnostic.config({
        virtual_text = false,
      }),
    })
    vim.keymap.set("", "<Leader>l", require("lsp_lines").toggle, { desc = "[L]sp_lines toggle" })
  end,
}
