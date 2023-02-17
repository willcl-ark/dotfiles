return {
  "lukas-reineke/indent-blankline.nvim", -- Add indentation guides even on blank lines
  -- See `:help indent_blankline.txt`
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("indent_blankline").setup({
      options = {
        char = "┊",
        show_trailing_blankline_indent = false,
      },
    })
  end,
}
